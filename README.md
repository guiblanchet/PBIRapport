# PBIRapport
Construction de rapport pour les cours PBI à l'Université de Sherbrooke

# Installation du package R

```{r}
## Installation de devtools (si vous ne l'avez pas déjà)
# install.packages('devtools')

## Installation des package dépendant (si vous ne l'avez pas déjà)
# install.packages('glue')
# install.packages('purrr')
# install.packages('readxl')
# install.packages('rmarkdown')

# Charger devtools et installer le package
library(devtools)
install_github('guiblanchet/PBIRapport')
```

# Construction de rapport

Pour construire les rapports, il faut avoir un fichier .xlsx contenant les notes et les commentaires faits par les évaluateurs. Le fichier doit contenir les en-têtes suivante sur la première feuille:

* Nom de l’étudiant.e qui présente
* Nom de l’évaluateur/l’évaluatrice
* Rigueur scientifique - Note
* Rigueur scientifique - commentaires
* Pédagogie - Note
* Pédagogie - commentaires
* Réponse aux questions - Note
* Réponse aux questions - commentaires
* Note finale attribuée

La construction de rapports se fait avec le fonction `rapport` du package. 

À noter que les rapports pour tous les étudiants se construisent d'un coup en se basant sur les noms dans la section "Nom de l’étudiant.e qui présente".

```{r}
```
