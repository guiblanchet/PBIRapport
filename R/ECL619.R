#' @title Production de rapports pour le cours ECL 619
#'
#' @description Produit des rapports individuels personnalisés pour chaque étudiant ayant été évalué pour le cours ECL 619 (Initiation à la recherche en écologie) du département de biologie de l'Université de Sherbrooke.
#'
#' @param fichier Une suite de caractères définissant le chemin (et le nom) d'un fichier .xlsx qui a été généré automatiquement par un Google Form.
#' @param dossier Dossier où les rapports seront générés. Par défaut, le dossier de travail sera utilisé.
#'
#' @details
#'
#' Le fichier doit avoir une structure particulière pour les informations qui sont données aux étudiants soit standard. Spécifiquement, les colonnes avec les noms suivant doivent être incluse dans le fichier :
#'
#' * Nom de l’étudiant.e qui présente
#' * Nom de l’évaluateur/l’évaluatrice
#' * 1. RIGUEUR SCIENTIFIQUE (50%). - Les concepts propres à la discipline sont bien maniés et s’appuient sur des bases théoriques et/ou expérimentales solides. - L’orateur fait preuve de bonnes capacités d’analyse : le traitement des données est approprié aux              hypothèses. - Les conclusions sont dans les limites possibles de l’interprétation des résultats
#' * 1. RIGUEUR SCIENTIFIQUE - Commentaires
#' * 2. PÉDAGOGIE (50%) : - Le langage est précis, la voix est suffisamment forte et dynamique et le tempo est stimulant. - Le support audio-visuel est approprié et facilite la compréhension de projet de recherche; le              lettrage est assez gros pour 
#' * 2. PÉDAGOGIE - commentaires
#' * 3. RÉPONSES AUX QUESTIONS. On profite de l’occasion pour supplémenter l’information donnée au séminaire. On supporte l’information donnée en citant résultats et/ou la littérature. On justifie et on élabore; on montre qu’on connait le sujet d’étude et tout
#' * 3. RÉPONSES AUX QUESTIONS - Commentaires
#' * 4. CÔTE FINALE ATTRIBUÉE
#'
#' De plus, toutes les informations doivent être sur la première feuille Excel.
#'
#' @export
#' @importFrom readxl read_xlsx
#' @importFrom rmarkdown render
#' @importFrom purrr walk
#' @importFrom glue glue
ECL619 <- function(fichier, dossier = getwd(), evaluateurInclus = TRUE){
  # Lire évaluation
  dat <- readxl::read_xlsx(fichier, sheet = 1)

  # Nom d'étudiant
  etudiant <- unique(dat$`Nom de l’étudiant.e qui présente`)

  # Nombre d'étudiants
  netudiant <- length(etudiant)
  
  # Inclure le nom de chaque évaluateur
  evalu <- evaluateurInclus

  purrr::walk(
    .x = etudiant,
    ~ rmarkdown::render(
      input = system.file("rmd", "ECL619.Rmd", package = "PBIRapport"),
      output_file = glue::glue("{.x} - Évaluation détaillée.pdf"),
      output_dir = dossier,
      params = list(etudiant = {.x})
    )
  )
}
