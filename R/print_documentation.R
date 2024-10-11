#' Generate Documentation for a Package
#'
#' @param package_name Name of the package for which to generate function documentation.
#' @return Generates a markdown file with the function documentation and converts it to PDF.
#' @export
print_documentation <- function(package_name) {
  library(knitr)
  library(rmarkdown)

  #elenco di tutti gli oggetti nel namespace del pacchetto
  all_functions <- ls(getNamespace(package_name), all.names = TRUE)

  # Creazione Markdown
  output_file <- paste0(package_name, "_functions_output.md")
  sink(output_file)

  # Intestazione Markdown
  cat("# Function Code for Package", package_name, "\n\n")

  # Creazione dell'indice delle funzioni
  cat("## Index of Functions\n")
  for (func_name in all_functions) {
    func <- get(func_name, envir = asNamespace(package_name))
    if (is.function(func)) {
      cat(sprintf("- [%s](#%s)\n", func_name, func_name))
    }
  }
  cat("\n\n")

  # Iterazione attraverso l'elenco degli oggetti e visualizza il codice di ciascuna funzione
  for (func_name in all_functions) {
    func <- get(func_name, envir = asNamespace(package_name))
    if (is.function(func)) {
      cat(sprintf("## %s\n", func_name))
      cat("```r\n")
      print(func)
      cat("\n```\n\n")
    }
  }

  # Chiudere il file Markdown
  sink()

  # Converti il file Markdown in PDF con indice
  render(output_file, pdf_document(toc = TRUE, toc_depth = 2))
}
