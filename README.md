# docuPack 
**docuPack** is an R package designed to generate a detailed documentation file for any installed R package. It extracts the source code of all functions within a specified package, creates a markdown file, and converts it into a PDF. This allows users to inspect how functions perform calculations, including the wrapped sub-functions. 

## Installation 
Before using **docuPack**, ensure that the package of interest is installed in your R environment.
1. Install **docuPack** from GitHub:
 ```devtools::install_github("your_github_username/docuPack")```
 2. Load the package: 
 ```library(docuPack)```

## Usage
The package provides one main function: `print_documentation()`.

### `print_documentation(package_name)`

-   **Description**: Generates a markdown file containing the function names and source code of each function within the specified package. The markdown file is then converted to a PDF with a table of contents for easy navigation.
-   **Parameter**:
    -   `package_name`: The name of the package for which to generate documentation (must be installed in your environment).
-   **Output**: A PDF document with the function code from the specified package.

### Example
Let's try to generate sesame documentation:

``print_documentation("sesame")``

This will create a PDF file containing the source code for all functions within `ggplot2`, allowing users to explore its inner workings.

## Requirements

-   **knitr**: Used for generating markdown files.
-   **rmarkdown**: Required to convert markdown to PDF.

Install them if necessary:
``install.packages(c("knitr", "rmarkdown"))``

## License

This package is licensed under the MIT License. See the `LICENSE` file for more information.
