# État de relais — Projet Babylone (Nara)

- **Identifiant / branche / mission :** responsable / main / Finalisation vidéo Babylone Nara, inventaire des ressources locales, vérification des scènes critiques, sécurisation du relais et plan de montage cinématique.
- **Dernière mise à jour :** 2026-11-11, 09:43 CET
- **Échéance :** Aujourd'hui (fin de journée)

---

## 1. Faits vérifiés (chemins réels et intégrité constatée)

1. **Narration audio complète validée :**
   - Chemin : `/mnt/DONNEES/blindspot/public/audio/toutenpeinture/babylone_nara/voix_complete.mp3`
   - Durée ffprobe : `453.960000` s (7 min 33 s 96, soit 13 619 frames à 30 fps).
   - Statut : Piste multivoix (Narrateur, Nara, Belia, Père, Ilum, Ahum/Iddin, Créancier) déjà équilibrée et validée. Verrouillée : aucune modification ni rallongement autorisés.
2. **Alignement temporel Whisper :**
   - Chemin : `/mnt/DONNEES/blindspot/public/audio/toutenpeinture/babylone_nara/whisper/words_corrige_cible.json`
   - Statut : Alignement mot à mot validé sur 453,927 s.
3. **117 images personnages et accessoires disponibles :**
   - Originaux (1376×768) : `/mnt/DONNEES/blindspot/scripts/babylone_nara/reception_detourage_20261110_202007_442862/originaux/img1.jpg` à `img117.jpg` (117 fichiers).
   - Détourages finaux (PNG alpha) : `/mnt/DONNEES/blindspot/scripts/babylone_nara/reception_detourage_20261110_202007_442862/detourage_fini/img1.png` à `img117.png` (117 fichiers).
   - Manifeste et rapports : `manifest.json` avec sommes SHA-256 et dossiers `rapports/` présents.
4. **12 ancres de référence :**
   - Disponibles dans `~/Téléchargements/PACK_BABYLONE_ANCRES_RENUMEROTEES_V1.zip` et `BABYLONE_DOSSIER_CONSEIL_IA.zip` (img1 à img12).
5. **Cartographie et shotlist :**
   - `INDEX_V6.csv` dans `/mnt/DONNEES/blindspot/scripts/babylone_nara/prompts_v6/INDEX_V6.csv` : cartographie complète des sprites img1 à img117 vers les 90 séquences du récit.
   - `SCRIPT_CANON.md` et `SHOTLIST_V1.csv` dans `/home/tonoukon/Babylone_Equipe/BABYLONE_EQUIPE/01_CONTEXTE/`.
6. **Décors existants constatés sur le PC :**
   - Aucun set de décors finaux nettoyés (fonds 16:9 sans personnage) n'est packagé ou installé dans le projet.
   - Les fonds d'essais antérieurs (`F01_SALLE_TRANSACTION`, `F03_INTERIEUR_PERE`, `V2_FAMILLE_SEUIL`) étaient des maquettes de test rejetées.
   - Deux images d'étude sont présentes dans `01_CONTEXTE/` :
     - `APERCU_PILOTE_PERE.jpg` (1200×720) : référence de façade extérieure qui plaît au responsable (porte basse à gauche, banc de brique à droite).
     - `ETUDE_S020_CONFRONTATION.png` (1376×768) : **étude intégrée de la scène extérieure**, et NON l'intérieur sombre rejeté. Attention : ce n'est pas un fond séparé, et elle n'est pas validée pour la production.

---

## 2. Hypothèses et propositions artistiques (à valider par le responsable)

1. **Scène S020 (les hommes le soir) :**
   - **Hypothèse retenue :** La scène se passe DEHORS devant la façade du père, en fin de journée (crépuscule/pénombre).
   - **Statut des hommes :** Aucun statut inventé (le texte dit simplement *« Des hommes viennent le soir »*).
   - **Disposition proposée :** Nara doit être clairement du côté de son père. Les deux hommes doivent regarder le père et non l'objectif.
   - **Problème constaté sur les assets :** `img116.png` et `img117.png` sont des poses frontales qui regardent la caméra.
   - **Proposition de montage (sans forcer une cohabitation impossible) :**
     Découpage en plans successifs (champ / contrechamp) :
     - Plan 1 (large) : silhouettes extérieures au crépuscule.
     - Plan 2 (rapproché) : Nara au seuil (`img32`), inquiète, regardant son père.
     - Plan 3 (moyen) : le père assis sur son banc (`img79`), visage fermé.
2. **Décors indispensables (4 lieux maîtres fixes proposés) :**
   - Lieu 1 : Façade maison du père (déclinaisons : matin pour le puits/départ, soir pour S020, intérieur nuit pour S019).
   - Lieu 2 : Ruelle et Puits (matin ordinaire vs soir d'hiver).
   - Lieu 3 : Cour carrée Ilum/Belia avec tannur et auvent de la salle des actes (transaction, vie quotidienne, créancier).
   - Lieu 4 : Pièce de Nara (première nuit avec la jarre, maternité, berceuse finale avec Iddin).
3. **Principe de montage cinématique :**
   - Utiliser les 16 accessoires réels (`img96` à `img111` : jarre fêlée, tablette, poids d'argent, pain, tabouret, bijoux posés un à un) en inserts gros plans pour donner du rythme sans dépendre d'animations complexes.
   - Poses assises : s'assurer d'un contact visuel crédible au sol (natte) ou sur banc/tabouret, sans personnage flottant.

---

## 3. Limites des vérifications effectuées

- Les 117 détourages PNG n'ont pas encore été inspectés individuellement au pixel sur fond noir/fond coloré (les rapports automatisés signalent des résidus potentiels sur les bordures).
- Les fichiers audio n'ont pas été écoutés au casque durant ce scan (durée et intégrité vérifiées par ffprobe / JSON Whisper).
- La compatibilité des teintes colorimétriques entre les personnages Flow et les futurs décors devra être vérifiée sur les premiers plans rendus.

---

## 4. Blocages et besoins actuels

- Disponibilité des 4 fonds maîtres sans personnage.
- Initialisation et liaison du dépôt Git privé pour l'équipe (en attente d'approbation et d'URL de dépôt).

---

## 5. Prochaines actions exactes

1. Initialiser le dépôt Git local dans `/home/tonoukon/Babylone_Equipe/BABYLONE_EQUIPE` et afficher la liste des fichiers indexés.
2. Vérifier GitHub CLI (`gh auth status`).
3. Obtenir l'URL du dépôt GitHub privé vide créé par le responsable et pousser la branche `main`.
4. Établir la composition de montage Remotion (`BabyloneRoot.tsx`) calée sur `words_corrige_cible.json`.
