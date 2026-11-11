# Babylone : audit des décors et méthode de production (version finale)

Nov 11, 2026 · @knowledged

## Lecture rapide

Les deux lots ont échoué parce qu'on a dessiné des pièces avant d'avoir décidé où se passe chaque scène : le découpage lui-même place les hommes de S020 « à l'intérieur », et aucun plan de maison ne reliait les fonds entre eux. La méthode ci-dessous inverse l'ordre : géographie écrite d'abord, un décor maître par lieu, puis des angles dérivés, puis seulement les sprites.

**Statut du document.** Sections A à E issues d'un premier jet (autre session), reprises et revérifiées ponctuellement contre le ZIP ; sections F et G ajoutées. Les corrections apportées sont listées dans la note de vérification en fin de document.

**Ce qui a été réellement consulté.** Narration complète (script verrouillé, mots du JSON Whisper alignés sur S001–S090), découpage S001–S090 (CSV + chorégraphie), bible, contrôles des deux lots, aperçus et coordonnées des essais refusés, index V6, règles de géométrie, planches d'originaux et 12 ancres en vignettes.

**Ce qui n'a pas été inspecté.** Aucune des 117 images en pleine résolution ; aucun des fonds refusés en pleine résolution (aperçus de lot seulement) ; l'audio `voix_complete.mp3` n'a pas été écouté (les durées viennent du JSON de mots, estimées, non validées) ; les 12 prompts finaux d'ancres sont introuvables et ne sont pas supposés. Toute affirmation sur un détail fin d'une image (main, pied, motif) est à vérifier par un opérateur.

**Légende.** \[Dossier\] = lu dans un fichier du dossier. \[Vignette\] = vu sur planche ou aperçu basse résolution. \[Déduit\] = conclusion de l'auditeur. \[Proposé\] = décision à valider par le client.

**Les cinq décisions qui conditionnent tout :**

1. S020 (hommes) se joue devant la maison du père, en fin de journée, pas dans la pièce F03. S019 (père éveillé) reste la seule scène intérieure du père.
2. L'ouverture « dans cette pièce » est une salle des actes de la maison d'Ilum, ouverte sur la cour ; elle n'est jamais la maison du père.
3. Deux maisons, deux signatures visuelles fixes : père = façade basse, porte à gauche, banc de brique à droite ; Ilum/Belia = cour carrée à four (tannur) et porte de rue à linteau.
4. Un décor maître par lieu et par état lumineux ; les angles sont dérivés du maître, jamais de l'image précédente.
5. Poses assises : mesurer d'abord, choisir un support ensuite, régénérer en dernier recours (arbre en B4).

## A. Diagnostic

La cause principale est narrative et spatiale, pas graphique : des fonds ont été produits sans plan de lieux, puis l'intérieur a été dessiné parce que le découpage le demandait.

| # | Constat | Statut | Source |
| --- | --- | --- | --- |
| 1 | S020 est décrit comme « plan large intérieur » ; l'essai l'a placé sur `F03_INTERIEUR_PERE` avec img79 + img116/117. C'est l'intérieur noir refusé. L'erreur est dans le découpage avant d'être dans l'image. | Fait | PRE\_SHOTLIST (S020), maquettes\_placements\_lot02.json |
| 2 | S019 (père « ne dort plus », nuit) et S020 (hommes « le soir ») ont reçu le même fond : deux moments, deux lumières, un seul décor. | Fait | même JSON |
| 3 | S021 : le père attend sur le seuil au retour du puits, donc le matin même ; S020 est un récurrent (« viennent le soir »), pas la veille. Il faut deux états lumineux du même devant-de-maison (soir, matin), pas deux lieux. | Déduit du script | script verrouillé |
| 4 | « Dans cette pièce » (S008) cohabite avec « cour légèrement floue » (S001) et « Une cour, des pièces autour … un scribe accroupi » (S023). Le découpage mélange salle et cour pour une même scène. | Fait + risque | PRE\_SHOTLIST S001/S008/S023 |
| 5 | Les fonds de la maison familiale et de Belia ont des géométries générées séparément : aucun raccord assuré entre points de vue ni entre jour et nuit. F03 diffère de `V2_FAMILLE_INTIME_SOIR`. | Fait | CONTROLE\_PLACEMENT\_V2 |
| 6 | Un fond d'essai éclairé de jour (`V2_NARA_CHAMBRE`) a servi pour S085, scène de soir. | Fait | CONTROLE\_PLACEMENT\_V2 |
| 7 | Poses assises sans siège (bassin « dans le vide ») : img26, 49, 61, 68, 79 ; poses au sol demandant une natte : img19, 46, 55, 56, 74, 82, 86, 95. Un tabouret à quatre pieds avec traverses est déjà dans img63 et img104 : risque de second tabouret. | Observé en vignette, à vérifier plein format | planches originaux\_025/049/073/097 |
| 8 | Les poses « Ilum alité » img75/76 sont debout (vignette). Les plaques couchées V3\_ILUM\_MALADE/DECES sont vues du dessus, non détourées, avec une lampe moderne. | Observé en vignette | planches, bible |
| 9 | Les rapports de détourage signalent des alertes automatiques sur presque toutes les images ; aucun score n'a valeur de validation artistique. | Fait à revérifier | NOTICE\_V6 / rapports |
| 10 | Les images font environ 1376×768 : presque 16:9 mais pas exactement (1,792 contre 1,778). Il faut recadrer proportionnellement, jamais étirer. | Fait | 05\_ANCRES |
| 11 | Les tablettes img97/106/111 portent un pseudo-cunéiforme (vignette) ; img98 montre des poids de couleur pierre ; pas de poulie sur le puits ; pas de lampe en verre ; pas d'imagerie égyptienne ou néo-babylonienne (porte d'Ishtar). Garde-fous déjà écrits, à appliquer aussi aux fonds. | Fait | bible, règles |
| 12 | La V6 ne remplace aucune image existante : les prompts 31–62 sont conservés « par respect des sorties existantes, non certifiés après examen des images réelles ». Les gestes img37 et img39 (« sans objet ») sont signalés comme douteux. | Fait | NOTICE\_V6 |

**Constat 13 (ajout, Dossier).** Dans l'essai S020, le père assis (img79) est placé à 300 px de haut et les deux hommes debout (img116/117) à 280 px, sur un canevas 1376×768 : un personnage assis aussi haut qu'un debout trahit une échelle fausse, indépendamment du fond. Source : maquettes\_placements\_lot02.json.

**Constat 14 (ajout, Dossier).** Le découpage compte sept scènes « intégrées » (IN01–IN07) alors que l'index V6 contient déjà des poses à plusieurs personnages sur fond uni : img47, 52, 55, 56, 66, 77, 84, 85, 91. La plupart des exceptions annoncées ne sont donc pas nécessaires (voir C et D).

**Plans où le décor ne correspond pas à l'action** : S020 (intérieur noir au lieu du dehors), S019 (même fond que S020), S085 (fond de jour pour un soir), S066–S070 (plaque vue du dessus pour un alité qu'on doit voir de côté), S009 (le découpage dit « matin précédent », le script dit le même jour).

**Limites des règles existantes** (06\_SKILL). La géométrie (`h_frac(y)`, ancrage aux pieds, 0,45 H minimum) suppose un horizon et un sol mesurés dans le fond ; rien n'oblige à les mesurer avant la génération. C'est le chaînon manquant : section E, étape 3. Un score de linter ne prouve ni raccord ni beauté.

## B. Méthode des lieux cohérents

Tout est \[Proposé\]. Aucun plan ci-dessous n'est mesuré sur une image existante : ce sont des contraintes à imposer aux nouveaux fonds. Hypothèses historiques prudentes (hypothèses visuelles, pas des affirmations sur Sippar) : brique crue, toits plats en poutres de palmier et roseau, portes basses en bois, sols de terre battue, nattes de roseau, jarres de terre cuite, lampes à huile en terre à mèche.

### B1. Maison du père (Sin-eribam) : pauvre, basse, une seule ouverture

**Signature fixe** : façade de brique crue enduite, ocre fatigué, porte basse à gauche du cadre, banc de brique à droite de la porte, linteau en bois fendu, pot de terre cassé au pied du mur. La ruelle part vers la droite (vers le puits, à l'est). Aller au puits = sortie cadre droit ; retour = entrée par la droite, marche vers la gauche. Le quartier d'Ilum est dans l'autre sens (ouest, gauche) et n'est jamais montré depuis cette façade.

```text
Vue de dessus (nord en haut), caméra au sud face à la façade

   ouest <-- quartier d'Ilum        ruelle --> puits (est)

   [mur voisin]───────────────────────────[mur voisin]
   │ [PORTE basse]      [BANC de brique]            │
   │   intérieur : une seule pièce, foyer au fond,     │
   │   natte au sol, banc bas contre le mur du fond │
   └─────────────────────────────────────────┘
           ^ espace devant la maison (sol de terre battue, 4 a 5 m de profondeur utile)
```

Vues à produire : P1a façade maître soir (BG01) ; P1b même façade matin (BG02) ; P1c seuil en 3/4 rapproché (BG03) ; P3 intérieur lampe puis nuit (BG04, BG05). **Variables** : lumière, ombre du mur voisin, présence des personnages. **Fixe** : position de la porte, du banc, de la ruelle, matériau. L'intérieur P3 reprend le même enduit, le même linteau vu de dedans et le rectangle de lumière de la porte comme repère.

### B2. Ruelle et puits

R1 ruelle de brique (matin) ; R2 puits (margelle basse en briques, cordage, pas de poulie) ; R2-hiver (soir, ciel pâle, froid). Le puits est à l'est de la maison du père. Le puits et la ruelle ne partagent aucun détail avec les maisons : un angle de mur et un arc de brique servent de repères de quartier. Le puits est un seul lieu pour S042 (matin, après la première nuit avec Ilum) et S049–S051 (hiver) : géométrie identique, état durable différent (BG07 / BG08).

### B3. Maison d'Ilum et de Belia : plus aisée, ordonnée, cour carrée

**Signature fixe** : cour carrée de terre battue ; tannur (four d'argile) au côté ouest ; auvent de poutres sur le côté nord (salle des actes) ; porte de rue à linteau de bois et seuil en briques cuites au sud ; rideau de roseau sur la porte de chambre à l'est ; petite porte basse de la pièce de Nara dans l'angle nord-ouest.

```text
Cour I1, vue de dessus. Caméra maître = depuis la porte de rue, regarde le nord.

                          NORD
   ┌── pièce de Nara ──┬──── SALLE DES ACTES (auvent) ────┐
   │ (porte basse)    │  large ouverture sur la cour       │
 OUEST                                                    EST
   │ tannur + cuisine │            cour                   │ chambre
   │ ouverte (auvent) │                                   │ d'Ilum
   │                  │                                   │ (rideau)
   └─────────────────┴────── PORTE DE RUE (sud) ───────┘
```

Angles dérivés réalisables : I1a maître sud→nord ; I1b contre-champ nord→sud (porte de rue au fond) ; I1c ouest (cuisine) ; I1d est (chambre) ; I2 salle des actes intérieur (ouverture de cour à gauche) ; I4 pièce de Nara ; I5 chambre d'Ilum ; I6 façade de rue vue du dehors. **Fixe** : orientation des quatre côtés, tannur, porte de rue. **Variable** : lumière (matin, jour, soir, nuit), objets (laine, sacs d'orge, jarre à grain), état de la cour (vide, en deuil). La géométrie ne change pas sur les années ; seul l'âge se voit sur les personnages.

**Point d'attention.** La bible du découpage (D03) parle d'une « cour de transaction », le script dit « dans cette pièce » (S008) puis « Une cour, des pièces autour » (S023). Le plan ci-dessus réconcilie les deux : la salle des actes est l'une des pièces autour de la cour, ouverte sur elle, et c'est elle que montre l'ouverture.

### B4. Arbre de décision pour les poses assises ou au sol

1. **Lire l'image** : la pose a-t-elle déjà un siège ou un objet (img63, img104 = tabouret) ? Oui : aucun autre siège ; fond généré sans mobilier au même endroit.
2. **Mesurer** (pleine résolution, par un opérateur) : hauteur du bassin au-dessus de la base de la bbox, angle de caméra (face, 3/4, profil), ombre. Seuils indicatifs à calibrer sur img79 et img49 : bassin vers 0,3 à 0,4 H du sol = assise haute (banc, tabouret bas, billot) ; vers 0,15 à 0,25 H = natte ou plancher ; genoux ou accroupi = sol.
3. **Choisir le support** dans la liste prudente : natte de roseau (sol), banc de brique ou bloc de brique (assise haute), tabouret bas à trois pieds ou billot de bois. Pas de chaise à dossier ; pas de tabouret à quatre pieds avec traverses (look moderne, c'est celui d'img63/104).
4. **Plan de contact** : un point d'appui (milieu de la base de la bbox) et une ligne de sol à ±0,05 H ; support dessiné dans le fond (fond généré avec cet objet à la bonne place et à la bonne échelle) ou sprite séparé inséré derrière le personnage.
5. **Pose croisée** : si la pose chevauche le support ou si le bord d'une jambe tombe mal, un masque d'occlusion devant ; sinon passer à 6.
6. **Régénérer pose et support ensemble** seulement si 1 à 5 échouent. Validation client avant tout remplacement ; jamais d'écrasement ; nom `imgNN_v2`.

Coût et risque : étapes 1 à 4 = quelques minutes, risque nul ; étape 5 = un masque à la main par plan ; étape 6 = un crédit de génération plus un retour de détourage, risque de dérive du visage.

**Application aux poses existantes** (d'après vignettes des planches ; à confirmer plein format) :

| Image | Pose | Support proposé | Séquences |
| --- | --- | --- | --- |
| img79 | Père assis, bassin haut, sans siège visible | Banc de brique (dehors, à droite de la porte ; dedans, banc bas contre le mur du fond) | S019, S020, S030 |
| img49 | Nara assise, bassin haut, sans siège visible | Banc de brique bas ou billot dans la cour, au pied du mur est | S065 |
| img61 | Belia assise, bassin haut, sans siège visible | Banc bas ou billot devant le tannur | S045 |
| img68 | Belia assise ou accroupie, appuis à mesurer | Tabouret bas ou natte contre le lit | S067 |
| img26 | Ilum « assis bas sur le sol » (prompt 26) | Natte | non indexé |
| img74 | Ilum assis jambes croisées au sol | Natte | S039, S040 |
| img19, 46 | Nara assise ou agenouillée au sol | Natte | non indexé / S058 |
| img55, 56, 85, 86 | Nara et Iddin au sol ; Iddin assis au sol | Natte de la pièce de Nara | S085–S087 |
| img82 | Ahum assis au sol, genoux repliés | Natte ou sol battu | S014 |
| img87, 88 | Scribe accroupi | Aucun siège ; sol de la salle des actes | S023, S024, S028 |
| img95 | Sage-femme à genoux | Natte | S056 |
| img36 | Nara couchée sur le côté | Natte (plan de couche) | S033 |
| img63, 104 | Tabouret déjà dans l'image | Aucun ajout ; le fond reste vide à cet endroit | S048 |

### B5. Fiche d'identité d'un lieu (une page par lieu)

Matériaux ; trois repères fixes nommés ; orientation des portes ; hauteur d'horizon en pourcentage de l'image ; ligne de sol utilisable (y min et y max pour les pieds) ; zones libres (gauche, centre, droite) ; lumière par état ; objets autorisés ; objets interdits. Contrôle visuel d'une demi-page par fond, écrit par un opérateur, pas par un outil.

### B6. Règles de raccord

| Règle | Contenu |
| --- | --- |
| Directions d'écran | Maison du père : puits à droite, sortie de Nara vers la droite (S010, S018), retour par la droite (S021). Cour d'Ilum : cuisine et tannur à gauche, chambre d'Ilum à droite en vue maître ; ces côtés s'inversent dans le contre-champ nord vers sud (I1b). |
| Axe de la vente | Dans la salle des actes, Nara à gauche, scribe à droite, Ilum et Belia en face : les contrechamps gardent ce côté (S001, S008, S023–S028). |
| Deux plans d'un même lieu | Même angle maître ou angle dérivé explicitement nommé ; jamais deux angles contradictoires dans deux plans consécutifs (E7). |
| Changement de lieu | Un lieu différent doit se voir : matériau, teinte dominante et repère propre (puits, tannur, banc de brique) avant tout personnage. |
| Continuité d'objet | Un objet par plan et par lieu (jarre de Nara, jarre à grain, tabouret) ; la jarre de Nara est posée contre le mur de sa pièce (S032) et y reste visible la nuit (S033, S085–S087). |

## C. Tableau S001–S090

**Plan d'ensemble** : huit mouvements. Cadre fixe (S001–S009, salle des actes d'Ilum) → matin chez le père et puits (S010–S018) → la dette, le soir devant la maison du père (S019–S021) → la vente (S022–S031) → vie chez Ilum et Belia (S032–S048) → mort du père et naissance (S049–S058) → les années, maladie d'Ilum, créancier, bijoux (S059–S083) → Iddin et épilogue (S084–S090).

**Lecture.** Durées = estimations recalculées depuis la pré-shotlist (total 453,7 s, soit 7 min 34 s), non validées à l'écoute. Onze séquences durent moins de 2 s (S001, S003, S004, S005, S013, S017, S018, S029, S067, S074, S077) : un seul cadrage. Neuf durent 8 s ou plus (S021, S028, S036, S039, S046, S048, S057, S064, S079 ; S057 = 13,5 s) : au moins deux états visuels. Codes BG, EL et IN = section D.

**Colonne Images.** Les numéros viennent d'INDEX\_V6 (fonction et séquences indexées), des ancres img1–12 et des poses img13–30 (non indexées, fonction lue dans leurs prompts). La désignation est lue dans les fichiers ; l'aspect réel (pose, orientation, mains) n'a été vu qu'en vignette. Tout est \[Proposé\] sauf mention.

### C1. S001–S030

| S · durée | Passage · lieu · moment | Plan et intention | Fond | Images · placement · support | Risque → solution |
| --- | --- | --- | --- | --- | --- |
| S001 · 1,0 s | « Tu t'appelles Nara. » Salle des actes d'Ilum, jour | GP Nara, regard vers le scribe hors champ (à droite) | BG17 flou | img1 (ou img13), à gauche | Le CSV dit « cour floue » : trancher pour la salle (BG17) |
| S002 · 3,5 s | « Dans quelques minutes… » idem | Insert calame suspendu sur argile vierge | EL01 sur BG17 flou | img97 (tablette + calame) | img97 porte un pseudo-cunéiforme en vignette : vérifier ; sinon EL01 vierge |
| S003 · 1,5 s | « Et à côté de ton nom, deux mots. » idem | Autre angle de l'argile, puis GP Nara | EL02, BG17 | img97 ; img1 | Aucun signe lisible : surface érodée |
| S004 · 0,5 s | « Épouse. » idem | PR Ilum, regard à gauche vers Nara | BG17 flou | img3 (ou img27) | 0,5 s : un cadrage, pas de contrechamp |
| S005 · 0,4 s | « Esclave. » idem | PR Belia, même axe | BG17 flou | img2 (ou img21) | idem |
| S006 · 2,1 s | « Épouse pour un homme… » idem | Nara, Ilum, Belia en alternance | BG17 | img1, img3, img2 | Répétition avec S004–S005 et S026 : fusionner S004–S006 en un montage d'environ 3,0 s |
| S007 · 2,5 s | « La même tablette, la même main… » idem | Insert main et tablette, autre angle | EL02 | img97 ou EL02 | Contact main–argile : élément conçu d'un bloc |
| S008 · 3,1 s | « Et personne, dans cette pièce… » idem | PM groupe tourné vers la transaction, Nara exclue | BG17 | img15 (Nara immobile, à gauche) ; scribe img87 à droite ; Ilum img3 et Belia img2 en face | Respecter « pièce » : plan intérieur obligatoire |
| S009 · 2,2 s | « Mais ce matin… » salle → façade du père, matin | PR Nara, coupe franche vers le matin | BG17 → BG02 | img13 | Le CSV parle du « matin précédent », le script dit le même jour : lumière de matin, rien d'antérieur |
| S010 · 2,5 s | « Ce matin, tu vas chercher de l'eau. » façade du père, matin | PM Nara sort de la porte avec la jarre | BG02 | img112 (index S010) ; img31 si de dos | Appui devant la porte (gauche). Contrôle lot 2 : img112 ne porte pas la jarre strictement contre la hanche |
| S011 · 4,1 s | « Tu vis à Sippar… » ruelle R1, matin | PL de la rue de brique, Nara avance vers la droite | BG06 | img112 en glissement lent (img14 marche mais sans jarre) | Une pose fixe ne garantit pas la marche (NOTICE\_V6) ; la jarre doit rester présente. L'essai V3\_RUELLE est à remplacer |
| S012 · 5,3 s | « La jarre… sa fêlure » R1 | PM jarre contre la hanche, puis insert fêlure | BG06 flou + img96/img113 | img112 → img113 | Lot 2 : doigts sur l'épaule de la jarre, pas sur la fêlure. Corriger avant validation (recadrage de img96 ou retouche ciblée sur validation client) |
| S013 · 1,4 s | « Ta mère est morte… » R1 | PR Nara | BG06 flou | img112 recadrée | Ne pas rejouer la caresse de S012 |
| S014 · 3,8 s | « Depuis, tu chantes… le soir » intérieur du père, soir | PM Nara et Ahum, pose de chant, évocation | BG04 | Nara img19 (assise au sol, natte) ; Ahum img82 (écoute la berceuse) | Intérieur lisible : lampe et rectangle de porte clair, pas de noir |
| S015 · 3,0 s | « Il s'appelle Ahum… froid aux pieds » idem | PM Ahum, pieds visibles, puis visage | BG04 | img81 ; img29 (question) | Pieds coupés : cadrage large |
| S016 · 3,0 s | « Il te suit jusqu'à la porte. » seuil du père, matin | PM seuil puis PR Ahum | BG03 | img81 (au seuil) + img112 | Seuil identique à BG02 |
| S017 · 1,7 s | « Le temps de remplir la jarre. » idem | PR Nara, jarre dans le bas | BG03 flou | img112 | — |
| S018 · 1,7 s | « Tu viens de mentir… » façade, matin | Plan de dos, Nara part vers la droite, Ahum reste au seuil | BG02 | img31 (de dos) ; img81 à la porte | Ahum à gauche (porte), Nara sort cadre droit |
| S019 · 5,3 s | « Ton père… ne dort plus. Il doit de l'orge… » intérieur du père, nuit | PM père veillé + insert orge clairsemé | BG05 + img99 | img79 sur banc bas ; img99 (sac d'orge) | Assis sans siège : arbre B4. Ne pas montrer de somme comptée |
| S020 · 2,6 s | « Des hommes viennent le soir… ils se taisent. » **devant la maison du père, soir** | PL : père assis sur le banc, deux hommes debout face à lui, Nara arrive par la droite et ils se taisent | BG01 | img79 sur le banc de brique ; hommes img116 (robe brune, barbu) et img117 (tunique bleu-gris) entre la porte et le banc, regards vers le père ; Nara img32 à droite | Statut des hommes non dit : aucun signe de créancier. Échelle : assis ≈ 0,7 à 0,75 de la hauteur d'un debout (constat 13) |
| S021 · 8,0 s | « Quand tu reviens du puits… robe propre… » seuil du père, matin | PL arrivée de Nara, puis insert manteau serré | BG02 → BG03 | père img78 (debout, robe sur le bras) au seuil ; Nara img32 arrive par la droite | 8 s : deux états. Jarre à faire suivre de S021 à S032 (voir note ci-dessous). Insert manteau = recadrage de img78, résolution à vérifier |
| S022 · 2,3 s | « Vous marchez jusqu'à une maison… » quartier d'Ilum, jour | PL ruelle, père et fille | BG09 | père img28 (de dos) ; Nara img14 (marche vers la droite) | Mur d'arrivée = porte de rue d'Ilum (BG10). Pas de pose de marche du père de face |
| S023 · 6,2 s | « Une cour, des pièces… un scribe accroupi » cour d'Ilum, jour | PL cour, puis détail du scribe sous l'auvent | BG11 → BG17 | Ilum img3, Belia img2, scribe img87, img97 | La salle s'ouvre sur la cour (B3) |
| S024 · 4,0 s | « Il imprime ses signes… » salle des actes | Scribe accroupi, calame contre l'argile, réactions | BG17 | scribe img88 (lit) ; Nara img33 ; img97 | Argile jamais lisible |
| S025 · 4,2 s | « Cinq sicles d'argent… » idem | Insert poids d'argent puis PR Nara | EL03 (img98), BG17 | img98 ; img33 | Pas de pièces de monnaie ; img98 couleur pierre à reprendre |
| S026 · 4,2 s | « Pour l'homme… pour sa femme… » idem | Ilum, Belia, Nara dans l'axe | BG17 | img3, img2 (ou img21–24), img33 | Mêmes cadrages que S004–S006 : prendre un 3/4 différent |
| S027 · 5,5 s | « Épouse. Tu cherches… » idem | PR Nara, regard tablette puis Belia | BG17 | img34 | — |
| S028 · 9,4 s | « Il y a une dernière ligne… » idem | Tablette, profil du scribe, Nara regardant Belia | BG17 + EL02 | img88, img34, img2 | 9 s : trois états ; la sanction n'est pas montrée |
| S029 · 1,3 s | « Tu portes la main à ta natte. » idem | GP tresse | EL05 sur BG17 flou | img16 (touche sa tresse) recadrée | Résolution du recadrage à vérifier, sinon EL05 dédié. Une seule tresse, toujours la même |
| S030 · 4,6 s | « Ton père se lève… Ahum aura à manger. » salle, puis cour | Coupe : père assis → debout → de dos vers la porte de rue | BG17 → BG14 | img79 (assis, natte) → img80 (se lève et parle) → img28 (de dos) ; Nara img35 | Coupe de pose, pas de transition animée |

**Note de continuité de la jarre (ajout).** Nara revient du puits avec la jarre (S021), la porte jusqu'à chez Ilum, puis la pose contre le mur de sa pièce (S032). Les poses img33–35 n'ont pas de jarre. Décision à prendre : la jarre est laissée hors champ pendant S022–S031 (cadrages qui ne montrent pas les mains) et réapparaît en S032 comme objet (img96), ou img112 est réutilisée à S022. Dans les deux cas, ne pas inventer de pose de jarre pour S023–S031.

### C2. S031–S060

| S · durée | Passage · lieu · moment | Plan et intention | Fond | Images · placement · support | Risque → solution |
| --- | --- | --- | --- | --- | --- |
| S031 · 4,4 s | « ton prix est un repas pour ton frère » cour d'Ilum, jour | PR Nara, regard du seuil à l'argent | BG14 flou + EL03 | img35 ; img98 | Ne pas la montrer suivant son père |
| S032 · 4,9 s | « Tu poses ta jarre contre le mur… » pièce de Nara, jour | PM Nara pose la jarre contre le mur, la regarde | BG19 | Nara img112 puis jarre img96 au sol (EL04) | Jarre posée = objet indépendant, pas de main « collée » |
| S033 · 6,7 s | « La première nuit… pieds froids » pièce de Nara, nuit | PR Nara couchée cherche le vide à côté d'elle ; jarre visible | BG20 | img36 (couchée sur le côté, natte) ; img96 contre le mur | Fond de nuit lisible (lune par la porte ou lampe), pas noir |
| S034 · 7,8 s | « Belia a le dos droit et les mains rouges » cuisine, jour | Insert mains puis portrait de Belia | BG15 + EL10 | img2 ou img21 (debout, autoritaire, bijoux) | Mains rouges : détail à vérifier en pleine résolution ; bijoux visibles dès ici |
| S035 · 6,8 s | « Elle te montre… laine… eau » cuisine et cour | Trois vignettes : rangement, laine, eau | BG15, BG11 | Belia img57 ; Nara img37 ; laine img100 | img37 est un geste sans objet (NOTICE\_V6) : placer img100 sans contact main–objet. Trois vignettes au plus |
| S036 · 8,6 s | « La dernière ligne, elle ne la répète pas » cuisine ou pièce de Nara | Nara seule, lèvres entrouvertes, mains figées | BG15 ou BG19 | img15 ou img40 | Le CSV ajoute un 3e geste vers la natte : retirer, garder S029 et S055 |
| S037 · 6,4 s | « Une voisine passe… » rue d'Ilum → seuil | PM seuil de rue, puis contrechamp Belia derrière | BG10 → BG14 | voisine img94 à gauche ; Nara img38 dans l'embrasure ; Belia img58 en retrait à droite | Belia observe, ne parle pas |
| S038 · 5,7 s | « Dans la rue… dans la cuisine » rue → cour → cuisine | Trois coupes, déplacement vers l'ouest (gauche) dans la cour | BG10, BG11, BG15 | img38 puis img37 puis img15 | Raccord de direction |
| S039 · 10,3 s | « Ilum, lui, a la voix douce… merci » salle commune d'Ilum, soir | PM repas puis PR Nara | BG18 | Ilum img74 (assis jambes croisées, natte) ; Nara img39 ; bol img101 | 10 s : 2 à 3 états. img39 sans objet : bol img101 placé à côté, sans contact de main |
| S040 · 6,5 s | « Un soir, il te demande de rester… » idem | Ilum s'adresse à Nara, elle suspend son geste ; Belia se lève | BG18 | img74, img40, img59 (Belia quitte le repas) | Belia sort cadre gauche sans regarder Nara |
| S041 · 6,9 s | « Personne ne t'a jamais appris… » idem | PR Nara puis cadre vide | BG18 vide | img40 | Cadre vide = BG18 sans personnage |
| S042 · 7,6 s | « Le lendemain, tu portes l'eau… » puits R2, matin | Eau portée, lavage trop fort, visage détourné | BG07 | img41 (se lave les mains) ; img50 ou img114 en arrivée | Pas de poulie ; jarre à la margelle |
| S043 · 7,5 s | « La porte se refermera encore… » chambre d'Ilum côté cour → salle | Porte, repas, merci, par coupes | BG21, BG18 | Ilum img3 ou img74 ; Nara img20 (deuil et colère retenus) | Suggestion seule, pas de scène ni de nombre de soirs |
| S044 · 3,3 s | « Belia ne te regarde plus… sac d'orge » cuisine, jour | Insert mains de Belia sur le sac | EL10 sur BG15 | img60 (mains devant) ; img99 | Mains tremblantes : pose à vérifier |
| S045 · 7,2 s | « Une nuit, tu la surprends… feu éteint » cuisine, nuit | Nara dans l'ouverture, Belia assise devant le feu | BG16 | Belia img61 sur banc bas ou billot ; Nara img15 debout | Feu éteint : pas de braises, lumière bleutée lisible |
| S046 · 9,2 s | « Quelques mois plus tard… un enfant » pièce de Nara, jour | PR visage puis plan du ventre | BG19 | img42 ou img18 (enceinte) | Le précédent jet citait img46 : c'est Nara penchant vers le bébé (S058), pas la grossesse. 9 s : 2 états |
| S047 · 6,1 s | « Belia le comprend avant toi… » cour, jour | Belia regarde longuement puis s'éloigne ; ellipse de deux jours | BG11 matin → BG11 soir | img62 (observe la grossesse) | Même angle, lumière change |
| S048 · 8,1 s | « pain en plus et un tabouret… Tu manges quand même. » cuisine, jour | Avant/après : pain puis tabouret ; Nara mange | BG15 | Belia img63 (pain sur tabouret, vers la droite) ; img103 ; img104 ; Nara : pas de pose « elle mange » | Un seul tabouret (celui de img63/104, à quatre pieds). Nara qui mange : img19 assise au sol et pain img103 sans contact main–bouche, ou ellipse |
| S049 · 3,3 s | « Une porteuse d'eau t'arrête… » puits, hiver, soir | PM la porteuse s'approche, baisse la voix | BG08 | porteuse img93 ; Nara img42 | Lumière froide |
| S050 · 3,7 s | « Ton père est mort… » idem | PR Nara, silence | BG08 flou | img42 | — |
| S051 · 4,3 s | « Ahum a été recueilli… » idem | Nara regarde vers les ruelles | BG08 | img93 ; img42 de profil si disponible | Ne pas identifier le parent |
| S052 · 3,9 s | « Tu demandes… — Non. » cour, jour | Champ-contrechamp Nara et Belia | BG11 | Nara img43 à gauche ; Belia img64 à droite | Respecter l'axe de la cour |
| S053 · 3,2 s | « Elle a la jarre à grain… » cour | PM Belia debout, jarre à grain | BG11 | img64 ; img105 | img105 ≠ jarre de Nara (forme, pas de fêlure) |
| S054 · 6,8 s | « Les mots montent… » cour | PR Nara, regard Belia puis seuil | BG14 flou | img44 | Rien à lire sur les lèvres |
| S055 · 5,7 s | « Tu touches ta natte… » cour | GP tresse, ventre, visage | EL05 | img44 (recadrages) | « Clé » partagée avec S029 |
| S056 · 3,8 s | « Ton fils naît… sage-femme » pièce de Nara, fin d'hiver | Cadrage sobre sur Nara, sage-femme partielle, puis enfant emmailloté | BG19 | Nara img45 ; sage-femme img95 (à genoux, mains sur ses genoux) ; bébé img12 sur la natte | Pas d'IN01 : le contact est évité par la coupe. Enfant img12 sur natte devant la sage-femme |
| S057 · 13,5 s | « Tu pensais ne rien ressentir… » pièce de Nara | PR Nara et bébé, détail du bébé, porte en avant-plan flou | BG19, EL12, BG21 | img47 (Nara avec nouveau-né) ; img12 | 13,5 s : 3 états ; pas de nudité ; ne pas inventer une nouvelle fermeture de la porte |
| S058 · 5,6 s | « Tu lui murmures son nom… » idem | PR Nara puis bébé | BG19 | img46 (se penche vers le bébé) ; img47 ; img12 | Pas de voix supplémentaire |
| S059 · 4,4 s | « Belia t'attend dans la cour… » cour, matin | PM Belia bras immobiles, contrechamp Nara avec enfant | BG11 | Belia img65 ; Nara img47 | — |
| S060 · 7,6 s | « Tu hésites une seconde de trop… » cour | Nara hésite, puis Belia tenant l'enfant | BG11 | Nara img47 ; Belia img66 (tient le bébé) | Pas d'IN03 : img66 existe. Pas de duo\_asset |

### C3. S061–S090

| S · durée | Passage · lieu · moment | Plan et intention | Fond | Images · placement · support | Risque → solution |
| --- | --- | --- | --- | --- | --- |
| S061 · 2,7 s | « Les années passent… » cour d'Ilum, années | Même angle, plusieurs lumières, Iddin d'âges différents | BG11 / BG23 | img115 (environ 2 ans) puis img83 (5 ans) | Géométrie identique, seul l'âge change |
| S062 · 4,9 s | « Ilum le soulève sur ses épaules… » cour, jour | Ilum portant Iddin, puis Nara qui sourit et regarde ailleurs | BG23 | img77 (Ilum porte Iddin) ; Nara img48 | Pas d'IN04 : img77 existe |
| S063 · 3,9 s | « Chante-lui la chanson » cour, soir | PR Belia puis Nara | BG12 flou | img67 ; img1 | — |
| S064 · 8,1 s | « C'est la berceuse de ta mère… » cour, soir | Jarre puis PR Nara, hésitation | BG12 flou + img96 | img96 ; Nara img13 ou img15 | 8 s : 2 états ; jarre de Nara ≠ jarre à grain |
| S065 · 6,6 s | « Tu chantes quand même… » cour, soir | Nara assise chante, Iddin s'endort, Belia écoute les yeux fermés | BG12 | Nara img49 (assise) sur banc bas ; Belia img67 debout ; Iddin img83 | Pas de pose « Iddin endormi » seul : img85 (duo existant) comme option. Bouche non animée ; chant audio à valider |
| S066 · 4,1 s | « Quand Iddin a cinq ans, Ilum tombe malade… » cour puis chambre | Iddin dans la cour, puis Ilum alité ; bol intact | BG11 → BG22 | img83 ; bol img102 ; Ilum : **pose manquante (IN08)** | img75/76 sont debout (vignette) : ne pas les utiliser couchés. Plaque V3\_ILUM\_MALADE vue du dessus, lampe moderne : à refaire |
| S067 · 1,9 s | « Belia le veille… Toi, tu apportes l'eau. » chambre d'Ilum | Un seul plan : Belia au chevet | BG22 | img68 sur tabouret bas ou natte ; bol img110 | Assise sans siège : arbre B4. Nara img50 ou img114 si elle apparaît |
| S068 · 6,4 s | « Un soir, il te regarde… » chambre | PR Ilum, bouche qui s'ouvre | BG22 | Ilum (IN08) ; Nara img51 | Aucune réplique inventée ; « merci » enregistré |
| S069 · 3,7 s | « Tu ne réponds pas… » idem | PR Nara | BG22 flou | img51 | — |
| S070 · 2,6 s | « Il meurt avant l'aube. » chambre, aube | Ilum immobile, rien de graphique | BG22 aube | Ilum (IN08) ; img76 hors usage | Lampe à huile en terre |
| S071 · 4,7 s | « Dix jours après… un homme frappe » cour puis seuil de rue | Porte vue de l'intérieur, puis créancier au seuil avec tablette | BG14 → BG10 | créancier img89 ; tablette img106 ; Belia img69 | Tablette illisible ; img106 pseudo-cunéiforme à vérifier |
| S072 · 3,0 s | « Belia lit les signes… » cour | Belia lit, contrechamp créancier, mains vides | BG11 | img69 ; img89 | — |
| S073 · 5,5 s | « L'homme regarde la cour… » cour | Coupes subjectives : cour, laine, jarre, Nara | BG11, BG15 | img90 ; img100 ; img96 ; Nara img1 | Il ne saisit rien |
| S074 · 1,1 s | « — Vous avez de quoi payer. » cour | PR créancier | BG11 flou | img90 | Regard sur Nara (le CSV disait Belia) |
| S075 · 4,5 s | « Tout revient : le scribe… » salle des actes (souvenir) | Scribe, argile, poids, puis Nara | BG17 lumière froide | img87, img97, img98, img33 | Souvenir distinct par la lumière et le cadrage, même décor |
| S076 · 3,4 s | « Tu serres Iddin contre ta jambe… » cour | Nara et Iddin, réaction de l'enfant | BG11 | img52 (Nara protège son enfant) ou img84 | Pas d'IN05 : poses à deux personnages existantes |
| S077 · 1,9 s | « — Revenez demain, dit Belia. » cour | PR Belia | BG11 flou | img70 | Un seul cadrage |
| S078 · 2,6 s | « Cette nuit-là… Belia marche » cour, nuit | Belia marche dans une direction constante, puis Nara éveillée | BG13 → BG20 | img71 ; Nara img19 (assise au sol, éveillée) | Direction établie une fois, gardée |
| S079 · 9,0 s | « Au matin… bracelet, collier, anneau » cour, matin | Trois inserts bijoux, puis main du créancier | BG11 | Belia img72 (mi-corps, retire son bracelet) ; img107, img108, img109 ; créancier img91 | Pas d'IN06 : contact évité par coupe (img72 → inserts → img91). Bijoux déjà portés dans img21–24 et img57–62 (index : « bijoux ») |
| S080 · 4,3 s | « Il compte, il hoche la tête, il part. » cour → porte de rue | Créancier sort, Belia debout mains vides | BG11 → BG14 | img92 ; Belia img73 (ou img25) | Sortie par la porte de rue (sud) |
| S081 · 4,3 s | « — Je ne l'ai pas fait pour toi… » cour | Champ-contrechamp Belia et Nara | BG11 | img73 ; img53 | Belia ne regarde pas Nara avant S082 |
| S082 · 6,3 s | « Elle te regarde enfin… » cour | Plan moyen, deux figures séparées | BG11 | img73 ; img53, distance de pieds de 0,8 H ou plus | Pas de contact |
| S083 · 6,5 s | « Tu entends ta propre voix : « Merci. » » cour | PR Nara, bouche close | BG11 flou | img54 | « ta propre voix » à vérifier à l'audio |
| S084 · 4,5 s | « Personne ne te libère… » cour → puits | Cour, puis eau à porter | BG11 → BG07 | img50 ; img114 (bol d'eau) | Pas de célébration |
| S085 · 6,4 s | « Ce soir-là, Iddin s'endort… » pièce de Nara, nuit | Nara et Iddin, l'enfant s'endort contre elle | BG20 | img55 (Nara assise berce son fils) ou img85 ; natte | Pas d'IN07 : poses existantes. **Ne pas** reprendre le fond de jour V2\_NARA\_CHAMBRE |
| S086 · 6,5 s | « — À qui elle est, la jarre ? » idem | Champ-contrechamp Iddin et Nara | BG20 | img86 (Iddin assis) ; img56 (Nara) ; jarre img96 | Fêlure visible au bord |
| S087 · 2,5 s | « Tu passes le doigt sur la fêlure. » idem | GP fêlure sous le doigt | EL04 sur BG20 flou | img113 ; img96 | Même fêlure qu'en S012 ; contact doigt–fêlure à vérifier (lot 2) |
| S088 · 6,7 s | « À Sippar, une tablette… Shamash-nuri » hors fiction | Tablette d'évocation générique | BG24 + EL02 | img111 | Pas de portrait ; marquer la sortie de la fiction |
| S089 · 4,4 s | « Épouse pour l'homme… » idem | Tablette et espace vide | BG24 | img111 | Aucun signe qui imite le document réel |
| S090 · 4,3 s | « Près de quatre mille ans plus tard… » idem | Tablette puis noir | BG24 → BG25 | img111 | Finir sur la tablette, pas sur la jarre |

Couverture : 90 lignes, de S001 à S090, aucune omise (S001–S030, S031–S060, S061–S090).

## D. Inventaire dédupliqué

24 fonds vides (BG25 est un noir, pas un décor), 7 éléments à produire (EL15 inclus), 1 exception intégrée (IN08). Les objets déjà générés dans les 117 images sont réutilisés tels quels. Format de tous les fonds : générés en 16:9 natif (ou plus large, recadré en 16:9), jamais étirés. Zones libres en tiers de l'image (G, C, D = gauche, centre, droite).

### D1. Fonds vides (BG)

| ID | Lieu · état | Angle | S couvertes | Zones libres | Dépendances · variantes |
| --- | --- | --- | --- | --- | --- |
| BG01 | Devant la maison du père · soir (maître P1) | face à la façade | S020 | G–C : hommes ; D : banc et père | Maître de BG02 et BG03 |
| BG02 | idem · matin | idem, même géométrie | S009, S010, S018, S021 | G : porte ; D : ruelle | Dérivé de BG01 |
| BG03 | Seuil du père · 3/4 rapproché | porte à gauche, banc décalé | S016, S017, S021 | C : deux personnages | Dérivé de BG01 |
| BG04 | Intérieur du père · soir, lampe (maître P3) | face au fond | S014, S015 | G–D : sol libre pour natte | Maître indépendant |
| BG05 | idem · nuit | idem | S019 | C : père assis sur banc bas | Dérivé de BG04 |
| BG06 | Ruelle R1 · matin | PL latéral, fuite à droite | S011–S013 | bande de sol 55 à 75 % | Maître R |
| BG07 | Puits R2 · matin | 3/4, margelle à droite | S042, S084 | G : sol | Dérivé de BG06 pour la rue |
| BG08 | Puits · hiver, soir | idem | S049–S051 | idem | État durable de BG07 |
| BG09 | Quartier d'Ilum · jour | PL latéral | S022 | sol 55 à 75 % | Mur de fond = BG10 |
| BG10 | Façade de rue d'Ilum · jour | face | S037, S038, S071 | C : embrasure | Porte à linteau, seuil de brique cuite |
| BG11 | Cour d'Ilum · jour (maître I1a, sud→nord) | PL | S023, S035, S038, S047, S052, S053, S059, S060, S061, S066, S072, S073, S076, S077, S079–S084 | C bas ; G tannur ; D chambre | Maître de BG12, BG13, BG14, BG15, BG16, BG21, BG23 |
| BG12 | Cour · soir | idem | S063–S065 | idem | Dérivé de BG11 |
| BG13 | Cour · nuit | idem | S078 | idem | idem |
| BG14 | Cour · contre-champ (nord→sud, porte de rue au fond) | PL ou PM | S030, S031, S037, S054, S071, S080 | C : porte | Dérivé de BG11 |
| BG15 | Cuisine et auvent ouest · jour | PM | S034–S036, S038, S044, S048, S073 | G : tannur | Dérivé de BG11 |
| BG16 | Cuisine · nuit, feu éteint | PM | S045 | C : tannur ; D : ouverture | Dérivé de BG15 |
| BG17 | Salle des actes · jour (maître I2) | face, ouverture de cour à gauche | S001–S009, S023–S029, S075 | G : Nara ; D : scribe ; C : tablette | Maître indépendant, ouvert sur BG11 |
| BG18 | Salle commune · soir, lampe | idem | S039–S041, S043 | C : bol, Ilum | Dérivé de BG17 (même pièce, autre usage) |
| BG19 | Pièce de Nara · jour (maître I4) | PM, natte au sol | S032, S036 (option), S046, S056–S058 | C bas | Maître indépendant |
| BG20 | idem · nuit | idem | S033, S078, S085–S087 | idem | Dérivé de BG19 |
| BG21 | Porte de la chambre d'Ilum, côté cour · soir | face, rideau de roseau | S043, S057 | C : rideau | Dérivé de BG11 |
| BG22 | Chambre d'Ilum · nuit puis aube | PM latéral | S066–S070 | C bas : couche | Maître indépendant, deux états |
| BG23 | Cour · lumière d'été des « années » | PL | S061, S062 | idem | État de BG11 |
| BG24 | Support de tablette, hors fiction | face | S088–S090 | C | Fond neutre sobre |
| BG25 | Noir | — | S090 | — | Pas un décor |

### D2. Éléments séparés

**À produire** (détourés sur fond contrasté) :

| ID | Élément | Usage | Rappel |
| --- | --- | --- | --- |
| EL01 | Calame + argile vierge, cadrage insert | S002, S075 | Seulement si img97 ne tient pas après contrôle (pseudo-cunéiforme) |
| EL02 | Tablette d'argile à surface érodée, sans signe | S003, S007, S028, S088–S090 | img97, 106, 111 portent un pseudo-cunéiforme en vignette : vérifier avant usage |
| EL11 | Lampe à huile en terre cuite, mèche | BG04, BG18, BG22 | Pas de lampe moderne ni de verre |
| EL12 | Rideau de roseau, avant-plan flou | S057 | Occlusion devant le personnage |
| EL13 | Poutre d'auvent, avant-plan flou | S023, S035 | idem |
| EL14 | Margelle du puits, avant-plan flou | S042, S049 | Pas de poulie |

**Ajout (pour F2 et F3).** EL15 : natte de roseau en perspective 3/4, une seule image réutilisée et redimensionnée sous les poses au sol (S014, S033, S039–S040, S056, S058, S085–S087). Elle est un élément séparé, jamais peinte dans le fond, pour que sa taille et sa position collent à chaque pose. Sept éléments à produire au total (EL01, EL02, EL11 à EL15).

**Déjà dans les 117 images (aucune génération)** :

| Image | Objet | S |
| --- | --- | --- |
| img96 | Jarre maternelle fêlée (EL04) | S012, S032, S064, S073, S086, S087 |
| img98 | Cinq poids d'argent (EL03) | S025, S031, S075 |
| img99 | Sac d'orge | S019, S044 |
| img100 | Pelote de laine | S035, S073 |
| img101, 102, 110 | Bol de repas, bol de maladie intact, bol d'eau | S039, S066, S067 |
| img103, 104 | Pain, tabouret (déjà dans img63) | S048 |
| img105 | Jarre à grain de Belia, forme distincte d'img96 | S053 |
| img106 | Tablette du créancier | S071, S072 |
| img107, 108, 109 | Bracelet, collier, anneau de Belia | S079 |
| img111 | Tablette d'évocation de fin | S088–S090 |
| img12 | Bébé emmailloté | S056–S058 |
| Recadrage img16 / img44 | Tresse (EL05) | S029, S055 |

### D3. Illustrations intégrées (IN), exceptions

| ID | Contenu | S | Raison | Alternative à essayer d'abord |
| --- | --- | --- | --- | --- |
| IN08 | Ilum couché, malade puis mort | S066–S070 | Pose absente : img75 et img76 sont debout | Pose correctrice img75\_v2 (Ilum couché de côté sur une couche basse, fond uni) à valider par le client ; scène intégrée BG22 + Ilum seulement en dernier recours |

Les sept autres exceptions du premier jet (IN01 à IN07) sont **abandonnées** : S056 (composition par coupe, img45 + img95 + img12), S057–S059 (img47, img12), S060 (img66), S062 (img77), S076 (img52, img84), S079 (coupe img72 → inserts → img91), S085–S087 (img55, img56, img85, img86). Restent à vérifier en pleine résolution : la lisibilité du contact dans ces poses à deux personnages (img47, 52, 55, 66, 77, 84, 85, 91), signalée par l'index comme « à vérifier après génération ».

### D4. Ce qui évite les défauts

- **Objets doublés** : un seul tabouret (celui de la pose ou celui du fond), une seule jarre de Nara (img96), une seule jarre à grain (img105). Chaque fond est généré sans jarre, tabouret, lampe ni personnage ; les objets entrent par les éléments.
- **Regards** : un tableau d'axes par lieu (B1 à B3, B6) ; le fichier de placement note le sens du regard avant le choix de l'image. Le sens réel de chaque pose se relève en pleine résolution.
- **Échelle** : horizon et ligne de sol mesurés en pourcentage sur chaque fond (E1.3), taille de sprite calculée, jamais devinée. Un assis fait environ 0,7 à 0,75 de la hauteur du même personnage debout (à mesurer sur img79, img61, img74).
- **Détourage** : fond de génération contrasté, examen visuel du bord, pas de halo ; 113 alertes automatiques sur 117 à trier par un opérateur.
- **Pieds et sièges flottants** : point d'appui = milieu de la base de la bbox ; ombre de contact de 4 à 8 px sous chaque appui ; vue de contrôle à 100 %.

## E. Stratégie de génération et de test

Principe : un maître stable par lieu, des angles dérivés de ce maître, un autre maître seulement pour un état durable (hiver, deuil). Jamais « image précédente comme seule référence » : l'erreur s'accumule à chaque génération. Aucun générateur ne garantit la géométrie ; chaque étape se termine par un contrôle humain.

### E1. Ordre de production

1. **Fiches de lieux** (B1 à B3, B5) validées par le client, texte seul. Coût nul, évite le rejet du lot suivant.
2. **Maîtres** : BG01 (père), BG11 (cour d'Ilum), BG17 (salle), BG19 (pièce de Nara), BG06 (ruelle). Cinq images, quatre variantes chacune, une retenue.
3. **Mesure** sur chaque maître retenu : horizon (% de la hauteur), ligne de sol y min et y max, zones libres, coordonnées des portes, sens des ombres, hauteur d'un adulte debout à trois profondeurs. Fichier `fond_NN.json`.
4. **Angles dérivés** : BG02, BG03, BG14, BG15… en joignant le maître et la fiche, et en décrivant l'angle en mots (« camera turned 180 degrees, the street door is now in the background »).
5. **États lumineux** : jour, soir, nuit à partir du maître de jour ; écrire quelles sources s'allument (lampe, lune, ciel).
6. **Éléments** (EL01, EL02, EL11 à EL14) et **IN08** seulement après validation des fonds, pour que la lumière soit fixée.
7. **Essais de placement** sur six plans (pilote G), puis lot complet.

### E2. Références à joindre

- Maître du lieu, extrait de la fiche (texte) et une ancre de style tirée du pack personnages (palette, trait) : par exemple img1 à img12 en vignette pour la palette.
- Pour un angle : aussi une capture annotée du plan de dessus avec la position de caméra.
- Pour un état nocturne : le maître de jour et la phrase « same architecture, same door position, same objects ».
- Jamais : une image d'un autre lieu, ni un fond refusé.

### E3. Garder portes et angles

- **Marqueurs** : trois repères nommés par fond (père : porte à gauche, banc à droite, pot cassé ; Ilum : tannur à gauche, linteau de rue, rideau à droite). Le contrôle est une liste de trois cases.
- **Test des deux positions** : en superposant maître et angle dérivé à 50 % (angle identique), la porte doit rester au même endroit.
- Si la génération invente une quatrième ouverture ou déplace la porte : rejet, pas de retouche.
- Les contre-champs ne sont pas garantis : on les accepte s'ils respectent les marqueurs et l'orientation, pas la géométrie exacte.

### E4. 16:9 sans déformation

Générer en 16:9 ou plus large. Les images de 1376×768 font 1,792:1 contre 1,778:1 : recadrage proportionnel d'environ 11 px en largeur (1365×768), jamais d'étirement. Sur un fond plus large, garder une marge de 6 % de chaque côté hors zones d'action pour un recadrage adaptable. Contrôle : ratio final mesuré, aucun personnage ni repère au bord.

### E5. Intégrer les sprites

- **Appui** : milieu de la base de la bbox ; sol mesuré (E1.3) ; taille `h(y) = H_sol × (y − horizon) / (sol − horizon)`. Distances entre pieds selon 06\_geometrie : conversation 0,8 à 1,4 H, minimum 0,45 H.
- **Profondeur** : tri par y des pieds ; pour qu'un personnage passe derrière un mur ou le rideau, masque d'occlusion peint sur le fond et appliqué au sprite.
- **Ombres** : ellipse douce de 4 à 8 px sous l'appui, sens cohérent avec la lumière ; soir = ombres longues et chaudes, matin = courtes. Pas d'ombre portée ajoutée si le sprite en porte déjà une dans son dessin (plusieurs planches montrent une ombre de sol sous les pieds, à vérifier).
- **Flou d'arrière-plan** : 3 à 5 px au plus, appliqué au fond seul avant le détourage final ; au-delà, halos.
- **Poses assises** : arbre B4 ; support dans le fond (généré vide à l'endroit voulu) ou sprite d'accessoire.
- **Échelle assis/debout** : un assis ne se met jamais à la même hauteur en pixels qu'un debout voisin (constat 13).

### E6. Sécurité et sauvegardes

- Chaque original reste intact ; un fond validé est copié en lecture seule avec un hash SHA-256 et une ligne de journal.
- Aucun remplacement d'une des 117 images sans demande explicite au client ; une version corrigée s'appelle `imgNN_v2`.
- Un essai refusé est conservé à part, jamais réutilisé comme référence. Aucune suppression : les fichiers remplacés vont dans `_a_supprimer/`.

Commandes opérateur (Tilix, depuis le dossier du projet) :

```bash
# Recadrage 16:9 sans étirement d'un fond 1376x768
convert fond_BG01_brut.png -gravity center -crop 1365x768+0+0 +repage fond_BG01_16x9.png
# Copie validée en lecture seule + hash dans le journal
mkdir -p fonds_valides essais_refuses _a_supprimer
cp fond_BG01_16x9.png fonds_valides/ && chmod a-w fonds_valides/fond_BG01_16x9.png
sha256sum fonds_valides/fond_BG01_16x9.png >> journal_sha256.txt
# Essai refusé : rangé à part, jamais supprimé
mv fond_BG01_brut.png essais_refuses/
# Test de placement : sprite redimensionné à H pixels de haut, pieds en (XF, YF)
# X = XF - largeur_sprite/2 ; Y = YF - H (calculés à partir de fond_NN.json)
convert fonds_valides/fond_BG01_16x9.png \( img79.png -resize x220 \) -geometry +X+Y -composite test_S020.png
```

### E7. Limites et vérifications par l'opérateur

- Un générateur d'images peut inventer des portes, déformer l'architecture entre deux angles, ajouter du texte ou des objets modernes, changer la palette, ou « remplir » une zone libre. Regard humain à 100 % sur chaque fond.
- Un contre-champ n'est jamais exact ; si deux plans successifs d'un même lieu se contredisent visiblement, réduire à un seul angle.
- Les prompts en anglais sont une base : prévoir en général deux à quatre essais par fond.
- Les prompts de la section F n'ont pas été testés sur un générateur ici ; ils ne sont pas validés tant que le pilote (G) n'a pas été joué.

## F. Trois exemples exploitables

Conventions : grille de travail 1376×768 avant recadrage 16:9 ; l'horizon et les tailles donnés ici sont des **valeurs de départ à remplacer par la mesure du maître retenu** (E1.3), pas des faits. Formule de taille : `H(y) = k × (y − y_horizon)`, avec k mesuré sur le maître. Lumière cohérente avec la géographie : caméra au sud face à la façade, soir = soleil bas à gauche (ouest), matin = soleil à droite (est). Les prompts sont en anglais, non testés sur un générateur.

### F1. Maison du père : devant la porte au soir, les hommes et le père (S019–S021)

**Extrait (script verrouillé, inchangé).** S019 : « Depuis la mauvaise récolte, ton père, Sin-eribam, ne dort plus. Il doit de l'orge. Il doit de l'argent. » S020 : « Des hommes viennent le soir, et quand tu entres, ils se taisent. » S021 : « Quand tu reviens du puits, il t'attend sur le seuil, ta robe propre à la main. »

**Choix du lieu.** Dehors, devant la façade (BG01), pas dans la pièce F03. Le texte ne dit pas « pièce » ; « viennent le soir » est un récurrent, « quand tu entres » se lit comme l'arrivée de Nara dans l'espace où ils sont. Le même devant-de-maison sert ensuite à S021 le matin (BG02, BG03) : une façade, deux lumières. S019 (père veillé, nuit) reste la seule scène intérieure (BG05). Le statut des hommes n'est pas affirmé : deux hommes ordinaires, aucun signe de créancier ni d'agent.

**Plans et références requis.**

| Plan | Fond | Images | Rôle |
| --- | --- | --- | --- |
| S020 PL maître | BG01 (soir) | img79, img116, img117, img32 | Établir la façade, le groupe et l'arrivée de Nara |
| S020 réaction (même fond, recadrage 1,5× à 1,8×) | BG01 recadré | img32 à droite, hommes à gauche | « ils se taisent » : aucun nouveau fond |
| S021 seuil | BG03 (matin, 3/4 rapproché) | img78, img32 | Père à la porte, robe sur le bras |
| S009, S010, S018 | BG02 (matin) | img13, img112, img31, img81 | Départ de Nara |
| Option vue de rue P1w | BG01w | aucune | Vue plus large, ruelle visible, pour une établissante unique |

**Références à joindre à la génération de BG01.** La fiche B1 (texte) et une ancre de palette (img4, le père, en vignette). Pas de fond refusé, pas de F03. Pour BG02 et BG03 : BG01 retenu, plus la phrase « same place, same door, same bench ».

**Prompt complet, décor vide (BG01, soir).**

```text
Hand-painted expressive 2D documentary illustration with clean contours, warm earthy palette, painterly but readable. 16:9 empty background plate. NO people, NO animals, NO text, NO watermark.

SETTING: the street front of a poor family house in a mud-brick town of ancient Mesopotamia (Old Babylonian period). Straight-on view of the facade, camera at standing eye level, horizon line at about 38 percent of the image height.

FIXED LANDMARKS (keep exactly as described):
1. One single low wooden plank door in the left third of the frame, closed, with a split wooden lintel above it. It is the only opening in the facade.
2. To the right of the door, a low bench built of plastered mud brick along the wall, seat height about 45 cm, long enough for two adults, completely empty.
3. At the foot of the wall right next to the door, one broken terracotta pot lying on its side.

ARCHITECTURE: facade of sun-dried mud brick covered with tired ochre plaster, uneven edges, hairline cracks, flat roof edge showing the round ends of palm-trunk beams and a few reeds. A blank neighbouring wall closes the frame on the far left. On the far right, a narrow alley between mud-brick walls recedes away toward the right edge (it leads to a village well that is NOT visible).

GROUND: dry pale beaten earth, a wide open strip in front of the facade.

LIGHT: late afternoon sliding into early evening. Low warm amber sun coming from the left, long soft shadows falling toward the right, sky graded from pale gold at the horizon to dusty rose and soft blue above. The scene stays clearly readable: shadows are light warm violet, never black. Not a night scene.

COMPOSITION: keep the lower central area (from 25 to 75 percent of the width, from 60 to 90 percent of the height) completely empty and flat for characters to be added later. No foreground clutter, no plants in front of the facade, no props on the ground.

AVOID: pulley, well, glass, metal tools, modern objects, chairs, tables, tiled roofs, columns, arches, glazed bricks, lions, Egyptian or Neo-Babylonian imagery, monumental gateways, any writing or cuneiform signs, dark interior glimpses.
```

**Variante matin (BG02), à joindre avec BG01.**

```text
Use the attached image as the exact same place. Keep the same facade, the same door in the left third, the same bench to the right of the door, the same broken pot, the same alley on the right, the same neighbouring wall, the same camera and framing. Change ONLY the light and the sky: early morning, cool clear light coming from the right, short soft shadows falling toward the left, pale blue sky with a thin warm band at the horizon, fresh pale ochre tones. No people, no animals, no text. Do not add, move or remove any object.
```

**Zones de placement et axe (valeurs de départ, grille 1376×768, horizon ≈ y 290, H(y) ≈ 1,15 × (y − 290)).** Axe de la scène : horizontal, du père (centre droit) vers les hommes (gauche) ; Nara entre par la droite derrière le père.

| Élément | Pieds (x, y) | Taille | Regard et note |
| --- | --- | --- | --- |
| Porte | base x 180–330, y 590 | haut. ≈ 0,85 H adulte | Repère fixe 1 |
| Banc | face avant x 430–760, base y 585 | assise ≈ 0,28 H | Repère fixe 2 ; assise à la hauteur du bassin du père |
| Père img79 | (560, 590) | ≈ 0,72 × H(590) ≈ 250 px | Assis sur le banc, pieds au sol devant lui ; regard à relever en pleine résolution (la vignette semble tournée vers la gauche) |
| Homme img116 | (400, 560) | H(560) ≈ 310 px | Face au père |
| Homme img117 | (480, 575) | H(575) ≈ 328 px | Un peu plus près, épaulté vers le père |
| Nara img32 | (1010, 610) | H(610) ≈ 368 px | Entre par la droite, ≥ 0,8 H du père |

**Vérifications (opérateur, 100 %).** Trois repères présents et à la bonne place (porte à gauche, banc à droite, pot cassé) ; une seule ouverture ; aucun objet sur la bande centrale ; ombres vers la droite et cohérentes avec les ombres de sol des sprites ; lisibilité du visage des trois hommes et de Nara à l'écran, pas de contre-jour ; bassin du père à la hauteur du dessus du banc, pieds au sol ; superposition de BG02 sur BG01 à 50 % : porte et banc au même endroit.

**Rejet.** Nuit noire ou intérieur sombre ; porte déplacée ou deuxième ouverture ; objet moderne ; banc invisible ou trop haut ; ombres incompatibles avec les sprites ; père plus grand que les hommes debout.

**Si img79 regarde à droite.** Inverser le sens de la scène n'est pas possible (la porte est à gauche) : on retourne le sprite en miroir (aucune asymétrie connue sur le père, à confirmer) ou on place les hommes à droite du banc et Nara arrive par la gauche, ce qui change la direction d'arrivée fixée en B6. Trancher après lecture plein format.

### F2. Maison d'Ilum et Belia : la salle commune au soir, Ilum assis au sol (S039–S040)

**Extrait (script verrouillé, inchangé).** S039 : « Ilum, lui, a la voix douce. Quand tu poses son bol devant lui, il dit « merci ». C'est le seul homme qui te l'ait jamais dit. » S040 : « Un soir, il te demande de rester après le repas. Belia se lève sans te regarder. Tu entends ses pas. Puis la porte qui se ferme. »

**Choix du lieu.** La salle principale d'Ilum (BG18), dérivée du maître BG17 (la salle des actes du jour). Hypothèse visuelle \[Proposé\] : la même pièce sert aux actes le jour et au repas le soir, ce qui évite un décor de plus et lie visuellement le contrat à la vie quotidienne. Si le client préfère que le repas se tienne sous l'auvent ouest, utiliser BG15 et adapter les coordonnées. La pose choisie est img74 (Ilum assis jambes croisées au sol, vignette) : aucune chaise à inventer, le support est une natte posée comme élément séparé. Les poses assises hautes (img49, img61, img79) suivent la même grille avec un banc dans le fond (voir F1 et B4).

**Plans et références requis.**

| Plan | Fond | Images et éléments | Rôle |
| --- | --- | --- | --- |
| S039 PM repas | BG18 | img74, img39, img101, EL15 (natte), EL11 (lampe) | Établir Ilum et la douceur du « merci » |
| S039 PR Nara | BG18 flou | img39 recadrée | Effet du mot |
| S040 PM | BG18 | img74, img40, img59 | Belia se lève et sort cadre gauche |
| S041 | BG18 vide | aucune | Cadre vide après la porte |

**Références à joindre.** BG17 (maître) pour dériver BG18 ; fiche B3 (texte) ; ancre de palette (img3, Ilum, en vignette). Jamais de fond refusé.

**Prompt complet, décor vide : maître BG17 (salle, jour).**

```text
Hand-painted expressive 2D documentary illustration with clean contours, warm earthy palette, painterly but readable. 16:9 empty interior background plate. NO people, NO animals, NO text, NO watermark.

SETTING: the main room of a comfortable, orderly household in a mud-brick house of ancient Mesopotamia (Old Babylonian period), seen from inside, camera at standing eye level, looking toward the west, horizon line at about 43 percent of the image height.

FIXED LANDMARKS (keep exactly as described):
1. On the LEFT third of the frame, a wide open side of the room with no door, framed by a thick timber lintel resting on two plastered mud-brick piers, opening onto a sunlit packed-earth courtyard (only a glimpse of courtyard ground and a plastered courtyard wall is visible).
2. In the back wall, centre-right, one shallow empty niche in the plaster at about 46 percent of the image height (a lamp will be added later, leave the niche empty).
3. Palm-trunk ceiling beams with reed matting, low and clearly visible along the top edge.

ROOM: plastered mud-brick walls in soft ochre and cream, clean and well kept, beaten-earth floor swept smooth. Warm daylight enters from the left opening: a soft light pool on the floor in the left half, gentle shade in the right half.

COMPOSITION: wide empty floor in the lower half of the image. Keep the left third, the centre and the right third of the floor completely free for characters to be added later. No furniture, no mat, no jars, no baskets, no lamps, no props.

AVOID: chairs, tables, shelves with objects, glass, metal fittings, modern objects, tiled floors, columns with capitals, Egyptian or Neo-Babylonian imagery, any writing or cuneiform signs.
```

**Variante soir BG18, à joindre avec BG17 retenu.**

```text
Use the attached image as the exact same room. Keep the same architecture, the same left opening with lintel and piers, the same niche in the back wall, the same ceiling beams, the same camera and framing. Change ONLY the light: evening. Through the left opening the courtyard is in fading dusk, a soft cool blue-violet with a last warm rim of light on the courtyard wall. Inside, a warm amber glow spills from around the empty niche in the back wall and makes a soft warm pool of light on the floor at the right-centre; walls turn warm golden brown, ceiling beams stay in gentle shadow. Everything stays readable, no pitch-black areas. No people, no animals, no text. Do not add, move or remove any object.
```

**Prompt séparé, élément EL15 (natte), pas une scène intégrée.**

```text
A single woven reed floor mat, rectangular, lying on the ground and seen in three-quarter perspective from slightly above, natural pale straw colour with darker woven bands and slightly frayed edges. Hand-painted expressive 2D documentary illustration with clean contours. Isolated object, entire object visible with safe margins, large within the 16:9 frame, perfectly flat solid magenta background contrasting with the object, no ground shadow, no text, no watermark.
```

**Zones de placement et axe (valeurs de départ, grille 1376×768, horizon ≈ y 330, H(y) ≈ 1,2 × (y − 330)).** Axe : horizontal, Nara à gauche, Ilum à droite ; l'ouverture sur la cour est à gauche, c'est la sortie de Belia. Contre-champ interdit sans nouvelle dérivation (la salle n'est garantie que sous cet angle).

| Élément | Pieds ou centre (x, y) | Taille | Note |
| --- | --- | --- | --- |
| Ilum img74 | (880, 610) | ≈ 0,75 × H(610) ≈ 250 px | Doit regarder à gauche : miroir si le sprite regarde à droite (aucune asymétrie connue) |
| Natte EL15 | centre (880, 614) | largeur ≈ 330 px, hauteur ≈ 70 px | Dessinée derrière le sprite ; dépasse de 15 % de chaque côté des genoux |
| Nara img39 | (560, 625) | H(625) ≈ 354 px | Debout à gauche, 0,95 H d'Ilum |
| Belia img59 | (300, 600) | H(600) ≈ 324 px | S040 : sort par la gauche sans regarder Nara |
| Bol img101 | centre (720, 648) | largeur ≈ 90 px | Posé par coupe après le geste de Nara, ombre de contact |
| Lampe EL11 | niche (1030, 355) | selon la niche | La lueur du fond doit venir de là |

**Vérifications (opérateur, 100 %).** L'ouverture reste à gauche et le repère de la niche au même endroit entre BG17 et BG18 (superposition 50 %) ; la natte porte le sprite sans pieds ni genoux hors de la natte ; aucune chaise dans le fond ; la lueur chaude vient bien du côté de la lampe ; ombres de contact sous Ilum, Nara, Belia et le bol ; img39 n'a pas d'objet en main (NOTICE\_V6) : le bol apparaît après le geste, pas dans la main ; hauteurs relatives assis/debout correctes.

**Rejet.** Fond de salle qui change de forme entre jour et soir ; porte inventée dans le fond ; natte coupée par la bbox ; sprite flottant au-dessus de la natte ; pièce noire ; lampe en verre ou métallique.

**Variantes.** Jour : BG17. Soir : BG18. Nuit non nécessaire dans cette salle. Si le client refuse l'usage double de la salle, dériver BG18 de BG15 (cuisine) à la place.

### F3. Plan rapproché d'un élément narratif : la fêlure de la jarre (S087)

**Extrait (script verrouillé, inchangé).** « — À qui elle est, la jarre ? demande-t-il, avant de s'endormir. — À ma mère. — Elle est où, ta mère ? Tu ne réponds pas. Tu passes le doigt sur la fêlure. » Le dernier énoncé est S087, 2,5 s.

**Choix du lieu.** La pièce de Nara, de nuit (BG20) : c'est là que la jarre est posée contre le mur depuis S032 et que se jouent S085 et S086. La fêlure doit être la même qu'en S012 (ruelle, jour) : même côté, même position près du bord. Le gros plan est donc dérivé de img96 (la jarre) et de img113 (Nara touche la fêlure), pas régénéré de zéro. Le contrôle du lot 2 signale que, dans img113, les doigts sont sur l'épaule de la jarre et non sur la fêlure : c'est le point à vérifier en premier.

**Arbre de décision pour S087.**

1. Lire img113 à 100 % : le doigt est-il sur la fêlure ? Oui : recadrage de img113 sur un fond BG20 flou.
2. Non : utiliser img96 agrandie (jarre seule) sur BG20 flou, le doigt arrivant par une coupe précédente (S086) et le gros plan montrant seulement la fêlure, sans main.
3. Si le client exige le doigt visible : générer la pose intégrée ci-dessous, nommée `img113_v2`, après validation.

**Plans et références requis.**

| Plan | Fond | Images et éléments | Rôle |
| --- | --- | --- | --- |
| S085 PM | BG20 | img55 (ou img85), EL15 (natte) | Iddin s'endort contre Nara |
| S086 champ-contrechamp | BG20 | img86 (Iddin), img56 (Nara), img96 au mur | La question de l'enfant |
| S087 GP | BG20 flou, recadré sur le pied du mur | img113 recadrée ou img96 agrandie | Le doigt sur la fêlure |

**Références à joindre.** Pour BG19 (maître) : fiche B3, ancre de palette. Pour BG20 : BG19 retenu. Pour img113\_v2 : img1, img96, img113.

**Prompt complet, décor vide : maître BG19 (pièce de Nara, jour).**

```text
Hand-painted expressive 2D documentary illustration with clean contours, warm earthy palette, painterly but readable. 16:9 empty interior background plate. NO people, NO animals, NO text, NO watermark.

SETTING: a very small, plain room given to a young servant woman in a mud-brick house of ancient Mesopotamia (Old Babylonian period), seen from inside, camera at standing eye level facing the back wall, horizon at about 42 percent of the image height. Daytime, modest, clean, slightly cramped.

FIXED LANDMARKS (keep exactly as described):
1. One small low wooden door in the left third of the frame, open, showing a sunlit strip of packed-earth courtyard outside.
2. One small high square window slit in the upper right of the back wall.
3. A low plastered ledge along the right wall at knee height, empty.
Palm-trunk ceiling beams with reed matting are visible along the top edge.

ROOM: unadorned plastered mud-brick walls in pale ochre, beaten-earth floor. Daylight comes from the open door on the left and from the window slit and forms a soft light patch on the floor near the centre.

COMPOSITION: the floor in the lower half is wide, empty and flat. Keep the bottom centre free for a mat and characters, and keep the base of the back wall between 40 and 70 percent of the width completely free (a clay jar will be placed there later). No furniture, no mat, no jars, no lamps, no props.

AVOID: chairs, framed beds, tables, glass, metal objects, modern objects, any writing or cuneiform signs, Egyptian or Neo-Babylonian imagery.
```

**Variante nuit BG20, à joindre avec BG19 retenu.**

```text
Use the attached image as the exact same room. Keep the same small low door on the left, the same window slit in the upper right, the same plastered ledge on the right wall, the same ceiling beams, the same camera and framing. Change ONLY the light: night. Cool blue moonlight comes through the open door and the window slit and falls in soft shafts on the floor; a faint warm amber glow rests on the right wall around the empty ledge (a lamp will be added later, do not draw it). The room stays readable: walls dark blue-ochre, floor lighter in the moonlit patches, no pitch-black areas. No people, no animals, no text. Do not add, move or remove any object.
```

**Prompt séparé, IMAGE INTÉGRÉE (exception : main + jarre), à n'utiliser qu'après échec des étapes 1 et 2 et accord du client. Ce n'est pas un fond vide.**

```text
Reference images: the attached clay jar (image 96) and the attached image of Nara touching the jar (image 113). Keep exactly the same jar (shape, terracotta colour, the same hairline crack near the rim on the same side as in image 96) and exactly the same woman's hand and skin tone as in the references. Hand-painted expressive 2D documentary illustration with clean contours. Extreme close-up in 16:9: only the upper part of the jar (rim and shoulder) and one hand are visible. The tip of the index finger rests directly ON the hairline crack near the rim, touching it, the other fingers softly curled along the jar, fingernails and knuckles drawn clearly, no ring, no bracelet. Soft low warm lamp light from the right, cool blue night tone in the shadows. Perfectly flat solid magenta background contrasting with the subject, no ground shadow, no text, no watermark, no face, no other objects.
```

**Zones de placement et axe (valeurs de départ, grille 1376×768, horizon ≈ y 323, H(y) ≈ 1,15 × (y − 323)).** Axe : horizontal ; Nara et Iddin à gauche, la jarre au mur à droite, regards vers la jarre.

| Élément | Pieds ou centre (x, y) | Taille | Note |
| --- | --- | --- | --- |
| Jarre img96 (plans larges) | base (760, 610) | ≈ 0,3 × H(610) ≈ 100 px | Contre le mur, ombre de contact ; une seule jarre dans la pièce |
| Nara + Iddin img55 ou img56 | base (500, 630) | Nara assise ≈ 0,72 × H(630) ≈ 250 px | Sur natte EL15, large de 350 px environ |
| Iddin seul img86 | base (500, 630) | ≈ 0,7 × H d'un enfant de cinq ans | Assis au sol, regard vers Nara |
| GP S087 | zone de recadrage du fond ≈ 460×259 px autour de (760, 540) | agrandi × 3 | Flou 4 à 5 px appliqué au fond seul ; jarre ou main à l'échelle du plan |

**Vérifications (opérateur, 100 %).** Fêlure du gros plan identique à celle de S012 et de img96 (même côté, même position près du bord) ; le doigt touche bien la fêlure ; ce n'est pas la jarre à grain img105 ; une seule jarre sur le plan ; fond non déformé après agrandissement × 3, sans halo ; lisibilité de la nuit (clair de lune, pas de noir) ; ombre de contact de la jarre au sol.

**Rejet.** Fêlure de l'autre côté ou d'une autre forme ; doigt sur l'épaule de la jarre ; deux jarres ; fond pixellisé après agrandissement ; main au visage ou bague ou bracelet (Nara n'en porte pas) ; image de fond non dérivée de BG19.

**Variantes.** Jour : BG19 (S032, S046, S056–S058). Nuit : BG20 (S033, S078, S085–S087). S012 (jarre contre la hanche, ruelle, jour) reste sur BG06 : la fêlure doit seulement se reconnaître d'un plan à l'autre.

## G. Pilote, lots et checklist de livraison

Le pilote prouve trois choses avant de produire les 24 fonds : la continuité d'un lieu entre angles et lumières, l'attrait artistique, la faisabilité avec les personnages déjà générés (les 117 images, sans en régénérer aucune). Il produit environ 10 fonds, EL15 et un test de gros plan. Budget indicatif \[Hypothèse\] : deux à quatre essais par fond, soit 20 à 40 générations. Rien n'est livré au client comme pack avant sa validation.

### G1. Critères d'acceptation

| Critère | Seuil proposé | Mesure |
| --- | --- | --- |
| Repères fixes | Trois repères de la fiche présents, à ±3 % de la largeur du maître, dans tous les angles de même direction | Superposition à 50 % |
| Ouvertures | Aucune ouverture en plus ou en moins par rapport à la fiche | Liste de cases |
| Horizon et sol | Horizon à ±2 % de la hauteur entre jour, soir et nuit d'un même angle | Lecture dans `fond_NN.json` |
| Lisibilité | Visages des personnages placés lisibles, aucune zone de jeu noire ; test à 320 px de large : lieu identifiable en une seconde | Opérateur, puis client |
| Appuis | Pieds ou base de bbox à ±0,05 H de la ligne de sol ; assis à 0,65–0,8 H de leur hauteur debout | Mesure sur compositions |
| Supports | Aucun pied ou siège flottant, aucun second tabouret, aucune chaise | Vue 100 % |
| Détourage et bords | Aucun halo visible à 100 %, aucun fond magenta résiduel | Vue 100 % |
| Attrait | Le client reconnaît une direction artistique commune entre les maisons sans les confondre | Validation client sur planche |

### G2. Épreuves du pilote

| # | Épreuve | Fichiers produits | Résultat attendu | Qui inspecte | Conditions de rejet |
| --- | --- | --- | --- | --- | --- |
| 1 | Maison du père : continuité soir, matin, seuil | `BG01_soir`, `BG02_matin`, `BG03_seuil`, `fond_BG01.json`, `superposition_BG01_BG02.png`, `test_S020.png`, `test_S021.png` | Même façade reconnaissable aux trois angles ; S020 lisible, dehors, en lumière de soir ; père assis sur le banc | Opérateur puis client | Intérieur ou nuit noire ; porte ou banc déplacés au-delà de 3 % ; assis plus grand que les debout ; hommes présentés comme créanciers |
| 2 | Maison d'Ilum : maître et deux angles | `BG11_maitre`, `BG14_contrechamp`, `BG15_cuisine`, `fond_BG11.json`, `superposition_BG11_BG14.png`, fiche I1 remplie | Tannur, linteau de rue et rideau retrouvables d'un angle à l'autre ; deux maisons visuellement distinctes de celle du père | Opérateur, relecture indépendante | Quatrième ouverture ; tannur déplacé ; contre-champ qui contredit le plan de B3 ; ressemblance avec la maison du père |
| 3 | Poses assises et au sol | `BG17_jour`, `BG18_soir`, `EL15_natte`, `test_S039.png`, `test_S045_banc.png` (img61 sur banc bas) | Ilum img74 posé sur la natte, Nara img39 debout, Belia img59 qui sort ; seuils de B4 calibrés sur les mesures réelles | Opérateur avec images pleine résolution | Genoux ou pieds hors natte ; sprite flottant ; regard d'Ilum vers la mauvaise direction non corrigé ; deuxième siège |
| 4 | Gros plan narratif | `BG19_jour`, `BG20_nuit`, `test_S087.png`, `comparaison_felure_S012_S087.png` | Fêlure identique à S012, doigt sur la fêlure ou plan de la fêlure seule, nuit lisible | Opérateur puis client | Fêlure de l'autre côté ; doigt sur l'épaule ; deux jarres ; fond pixellisé |
| 5 | Six plans pour varier les échelles | `test_S020_large.png`, `test_S020_reaction.png`, `test_S039_pm.png`, `test_S057_avantplan.png` (EL12 devant img47), `test_S087_gp.png`, `test_S021_seuil.png` | Large, moyen, gros plan personnage, gros plan objet, avant-plan flou : cinq types de plans lisibles sans monotonie | Client sur planche | Plans quasi identiques ; masque d'occlusion mal découpé ; avant-plan qui cache le visage |

L'épreuve 5 dépend des quatre premières. Un échec de l'épreuve 1 ou 2 bloque le lot complet : on corrige la fiche ou le prompt, pas le sprite.

### G3. Organisation par lots

| Lot | Contenu | Dépend de | Validation avant la suite |
| --- | --- | --- | --- |
| 0 | Fiches de lieux B1–B3 (texte), plan des maisons, règles B6 | rien | Client, texte seul |
| 1 (pilote) | BG01–BG03, BG11, BG14, BG15, BG17, BG18, BG19, BG20, EL15 | Lot 0 | Les cinq épreuves ci-dessus |
| 2 | BG04–BG10 : intérieur du père (soir, nuit), ruelle, puits (matin, hiver), quartier et façade d'Ilum | Lot 1 | Planche des 7 fonds |
| 3 | BG12, BG13, BG16, BG21, BG23 : états de la cour d'Ilum et porte de chambre | BG11 validé | Planche des états, superposition |
| 4 | BG22 (chambre d'Ilum, deux états), EL11 (lampe), EL12–EL14, EL01, EL02 | Lots 1 à 3 | Planche des éléments sur fonds |
| 5 | IN08 : pose couchée d'Ilum (`img75_v2`), après accord du client | Lot 4 | Validation client avant tout remplacement |
| 6 | BG24, BG25, essais de plans S001–S090 sur images fixes | Lots 1 à 5 | Montage à faire plus tard sur le PC Ubuntu |

### G4. Checklist finale pour la future livraison ZIP

- [ ] Arborescence : `fonds_valides/`, `elements/`, `fiches_lieux/`, `mesures/`, `tests_placement/`, `journal/`, `essais_refuses/`, `_a_supprimer/`
- [ ] Les 117 images d'origine intactes (hash identique au MANIFESTE\_SHA256.txt du dossier de conseil) ; aucune `imgNN_v2` sans validation écrite du client
- [ ] Chaque fond : PNG 16:9 sans étirement, fichier `fond_NN.json` (horizon, ligne de sol, portes, zones libres, sens des ombres, repères)
- [ ] Chaque lieu : fiche d'identité B5 remplie, planche de superposition jour, soir, nuit
- [ ] Un contrôle visuel d'une demi-page par fond, signé d'un opérateur ; mention explicite des images vues en pleine résolution et de celles qui ne l'ont pas été
- [ ] Un test de placement par fond (au moins un plan avec un personnage réel) et les masques d'occlusion utilisés
- [ ] Les 25 identifiants BG, les 7 EL à produire, IN08 : tous présents ou signalés manquants dans le journal
- [ ] `journal_sha256.txt` à jour ; les essais refusés rangés à part et jamais utilisés comme référence
- [ ] Une table S001–S090 : fond, images, appui, regard, statut (validé ou à vérifier) pour chaque séquence
- [ ] Aucun texte inventé sur les tablettes ; aucun signe cunéiforme lisible ; aucun objet moderne
- [ ] Aucune modification du script ni des voix ; avertissement de fiction réservé à la description séparée
- [ ] Pas de pack téléchargé par le client avant la validation du pilote ni de vidéo finale à cette étape

### G5. Images pleine résolution à demander avant le pilote

img79, img74, img61, img49, img68 (poses assises : mesure du bassin et sens du regard) ; img32, img116, img117, img78, img39 (scène du père et service du repas) ; img96, img112, img113 (jarre et fêlure) ; img97, img106, img111 (pseudo-cunéiforme) ; img47, img55, img66, img77, img91 (contacts des poses à deux personnages) ; les deux aperçus de lots refusés en pleine résolution pour confirmer le diagnostic. Aucune de ces images n'a été examinée en pleine résolution dans cet audit.

## Note de vérification et corrections par rapport au premier jet

Les sections A à E viennent du premier jet d'une autre session ; je les ai recoupées avec le ZIP et corrigées sur les points suivants.

- Les images indiquées « à choisir » dans le tableau C sont désormais celles de INDEX\_V6 et des poses img13–30 (lues dans leurs prompts).
- Sept scènes intégrées sur huit sont abandonnées : l'index contient déjà des poses à plusieurs personnages (img47, 52, 55, 56, 66, 77, 84, 85, 91). Reste IN08 (Ilum couché).
- S046 renvoyait à img46 (Nara se penche vers le bébé, S058) : remplacé par img42 ou img18 (grossesse).
- S065 : Nara est assise sur un banc (img49), pas « au sol » ; img26 est assis au sol et non « sans siège » ; img61 reste assise sans siège visible.
- Durées recalculées depuis la pré-shotlist : S034 = 7,8 s (non 8,2) ; S050 = 3,7 s ; S051 = 4,3 s ; neuf séquences de 8 s ou plus (non dix) ; S004–S006 = 3,0 s.
- Ajouts : échelle assis/debout fausse dans l'essai S020 (constat 13), jarre qui doit suivre Nara de S021 à S032, problèmes de contact déjà relevés au lot 2 (img112, img113), géographie de la ruelle (puits à l'est, quartier d'Ilum à l'ouest), EL15 (natte), commandes opérateur.
- Inchangé : aucun plan de maison, aucune mesure ni aucun prompt de ce document n'ont été testés sur un générateur ; la lecture des images repose sur des vignettes ; l'audio n'a pas été écouté.
