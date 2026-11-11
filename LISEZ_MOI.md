# Babylone — coordination d'équipe, version urgence

Objectif : produire une vidéo complète, lisible et aussi cinématographique que possible avant l'heure fixée par le responsable. Cet outil organise le travail ; il ne garantit ni les quotas ni l'export ce soir. Chaque personne utilise son propre accès, dans le respect des conditions du fournisseur. Ne partagez ni mots de passe ni sessions ; ne supposez pas que l'utilisation de plusieurs comptes pour contourner un quota est autorisée.

## Ce que contient ce dossier
Script canon, audit externe, chorégraphie et shotlist antérieures, deux images de contrôle. Les deux études ne sont pas des scènes validées ; l'ancienne composition est rejetée. Les 117 originaux et détourages, l'audio et les dossiers complets ne sont PAS inclus. Les références locales `/mnt/DONNEES/blindspot/...` concernent le PC d'origine : elles ne sont pas automatiquement disponibles chez les collègues. Le script canon ne doit pas être modifié.

## Installation responsable sur Ubuntu
1. Télécharger le ZIP de ce kit depuis le lien communiqué, puis :
```
cd ~/Téléchargements
unzip -n BABYLONE_EQUIPE_URGENCE.zip -d "$HOME/Babylone_Equipe"
cd "$HOME/Babylone_Equipe/BABYLONE_EQUIPE"
git init -b main
git add -- .gitignore LISEZ_MOI.md PROMPT_DEMARRAGE.md 01_CONTEXTE 02_TRAVAIL 03_OUTILS
git commit -m 'Initialisation coordination Babylone'
```
Si `git commit` demande une identité, configurer le nom et l'adresse Git selon les instructions affichées. Créer ensuite un dépôt **privé vide** sur GitHub et inviter les collaborateurs autorisés. Vérifier la politique de confidentialité du projet. Relier ce dépôt en remplaçant l'URL par son URL réelle :
```
git remote add origin URL_DU_DEPOT_PRIVE
git push -u origin main
```
L'URL ci-dessus est un exemple à remplacer, pas une commande prête à exécuter. L'authentification GitHub doit être configurée par chaque personne ; ne jamais inscrire de jeton dans un fichier ou une commande partagée. Pour la confidentialité du dépôt, vérifier séparément les paramètres GitHub et droits des collaborateurs.

2. Le responsable crée les tâches et fournit accès aux ressources par Drive privé ou copies locales autorisées. Ne pas envoyer les images originales, les voix, les identifiants ou des fichiers personnels sur GitHub par défaut. `01_CONTEXTE` contient script, audit et deux aperçus : ils seront publiés dans le dépôt privé après revue par le responsable.
3. Un collaborateur clone le dépôt, crée une branche propre, et ouvre le dossier dans son agent. Exemple :
```
git clone URL_DU_DEPOT_PRIVE
cd NOM_DU_DEPOT
git switch -c travail/alice-scene-maison
```
Puis coller `PROMPT_DEMARRAGE.md` dans son agent en précisant son identifiant et son périmètre.
4. Chaque personne écrit UNIQUEMENT dans `02_TRAVAIL/son-identifiant/`. À chaque petit jalon, l'agent met à jour `ETAT.md` dans ce dossier ; avant un changement de modèle, le point d'étape doit être déjà écrit. Exécuter `03_OUTILS/sauvegarder.sh son-identifiant` après avoir configuré le dépôt et sa branche. Le script vérifie le diff et demande confirmation avant le push. Pour un mode entièrement automatique il faudrait des permissions et réglages supplémentaires ; il n'est pas promis ici.
5. Le responsable intègre les branches après revue (pull request ou merge), puis chaque personne récupère le dernier `main` et crée sa propre branche. Ne jamais écraser une branche, utiliser `push --force`, supprimer les originaux ou travailler à plusieurs sur le même fichier. Git ne fusionne pas proprement images et audio ; conserver ces fichiers sur Drive avec version et identifiant.

## Si le quota est épuisé
Il n'y a aucune garantie que le modèle puisse agir après épuisement : écrire ETAT.md et sauvegarder après chaque étape, AVANT la limite. Si le modèle change, le nouvel agent lit ETAT.md, `git status`, les rapports et reprend la prochaine action. Le passage Opus → Gemini ou la publication automatique ne sont pas déclenchés par ce kit : l'utilisateur ou une automatisation du produit doit effectivement lancer le nouveau modèle ; vérifier que les fonctions existent et sont autorisées. Ne jamais compter sur un upload final exécuté après coup.

## Répartition suggérée (ajuster au temps)
A pilotage + montage ; B inventaire et intégrité ; C S001–S020 ; D S021–S040 ; E S041–S060 ; F S061–S075 ; G S076–S090 ; H décors et géographie ; I détourage et interactions ; J audio, timing et export. Une seule personne assemble et décide. Donner une échéance courte à chaque mission, puis intégrer les éléments acceptés, sans attendre dix audits exhaustifs.
