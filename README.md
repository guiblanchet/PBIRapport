# PBIRapport
Construction de rapport pour les cours de séminaires de recherche au département de biologie à l'Université de Sherbrooke

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

Pour construire les rapports, il faut avoir un fichier .xlsx contenant les notes et les commentaires faits par les évaluateurs. La structure des fichiers varie selon les séminaires (et donc les cours).

À noter que les rapports pour tous les étudiants se construisent d'un coup en se basant sur les noms des étudiants dans le fichier .xlsx.
