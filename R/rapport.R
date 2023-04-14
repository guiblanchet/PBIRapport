#' @title Production de rapports pour les cours PBI
#'
#' @description Produit des rapports individuels personnalisés pour chaque étudiant ayant été évalué pour les séminaires de recherche du département de biologie de l'Université de Sherbrooke.
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
#' * Rigueur scientifique - Note
#' * Rigueur scientifique - commentaires
#' * Pédagogie - Note
#' * Pédagogie - commentaires
#' * Réponse aux questions - Note
#' * Réponse aux questions - commentaires
#' * Note finale attribuée
#'
#' De plus, toutes les informations doivent être sur la première feuille Excel.
#'
#' @export
#' @importFrom readxl read_xlsx
#' @importFrom rmarkdown render
#' @importFrom purrr walk
#' @importFrom glue glue
rapport <- function(fichier, dossier = getwd()){
  # Lire évaluation
  dat <- readxl::read_xlsx(fichier, sheet = 1)

  # Nom d'étudiant
  etudiant <- unique(dat$`Nom de l’étudiant.e qui présente`)

  # Nombre d'étudiants
  netudiant <- length(etudiant)

  purrr::walk(
    .x = etudiant,
    ~ rmarkdown::render(
      input = system.file("rmd", "index.Rmd", package = "PBIRapport"),
      output_file = glue::glue("{.x} - Évaluation détaillée.pdf"),
      output_dir = dossier,
      params = list(etudiant = {.x})
    )
  )
}
