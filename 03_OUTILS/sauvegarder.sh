#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
if [[ $# -ne 1 || ! "$1" =~ ^[a-zA-Z0-9_-]+$ ]]; then echo 'Usage : 03_OUTILS/sauvegarder.sh identifiant_simple' >&2; exit 1; fi
who="$1"; folder="02_TRAVAIL/$who"
[[ -d "$folder" && -f "$folder/ETAT.md" ]] || { echo "Créer d'abord $folder/ETAT.md" >&2; exit 1; }
git rev-parse --is-inside-work-tree >/dev/null
branch=$(git symbolic-ref --quiet --short HEAD) || { echo 'HEAD détachée : choisir une branche.' >&2; exit 1; }
[[ "$branch" != main && "$branch" != master ]] || { echo 'Créer une branche de travail distincte de main.' >&2; exit 1; }
if ! git diff --cached --quiet; then echo 'Index non vide : traiter les modifications déjà indexées avant ce script.' >&2; exit 1; fi
# N'ajouter que des documents texte attendus, pas des fichiers inconnus ou médias.
while IFS= read -r -d '' file; do git add -- "$file"; done < <(find "$folder" -type f \( -name '*.md' -o -name '*.csv' -o -name '*.json' -o -name '*.txt' \) -not -name '*token*' -not -name '*credential*' -print0)
echo "Branche : $branch. Vérifier impérativement le contenu indexé, notamment données personnelles et secrets :"
git diff --cached --stat
git diff --cached -- . ':!*.csv' || true
if git diff --cached --quiet; then echo 'Rien à enregistrer.'; exit 0; fi
read -r -p 'Créer le commit et tenter le push ? [o/N] ' answer
if [[ ! "$answer" =~ ^[oO]$ ]]; then git reset -q -- "$folder"; echo 'Annulé, fichiers locaux conservés.'; exit 0; fi
git commit -m "Point de relais : $who"
if ! git remote get-url origin >/dev/null 2>&1; then echo 'Commit local conservé : aucun origin configuré.'; exit 0; fi
if git push -u origin "$branch"; then echo 'Push terminé. Vérifier le dépôt et ouvrir une pull request si nécessaire.'; else echo 'Échec push : commit conservé localement. Corriger accès ou divergence sans force push.' >&2; exit 1; fi
