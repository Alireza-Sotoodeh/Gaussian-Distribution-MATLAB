# Gaussian Distribution Analysis in MATLAB

This repository contains MATLAB scripts and a report for simulating and analyzing Gaussian random variables, focusing on their statistical properties such as mean, variance, and probability density function (PDF). The project is part of a Probability Engineering course (Spring 1403, Shahid Bahonar University of Kerman, supervised by PhD. A Zaimbashi) and is authored by Alireza Sotoodeh (Student ID: 401412056).

The code demonstrates generating Gaussian random variables, transforming their mean and variance, plotting their PDFs, and analyzing convergence behaviors. Statistical tests (e.g., Anderson-Darling, t-test, F-test, and autocorrelation) are included to verify normality and independence. The repository also includes a PDF report summarizing the project.

This project is similar in scope to my other repository, [Binomial-Distribution-MATLAB](https://github.com/Alireza-Sotoodeh/Binomial-Distribution-MATLAB), which focuses on binomial distribution simulations.

## Repository Contents

- **`pj2V2.m`**: Main script for generating a Gaussian random variable with specified mean and variance, plotting its PDF, and analyzing convergence of mean and variance. Includes statistical tests for normality and independence.
- **`meanofX.m`**: Script to study the convergence of the sample mean of a Gaussian random variable to its expected mean.
- **`EX3.m`**: Script to analyze the convergence of the sample mean of the cube of a Gaussian random variable ($E[X^3]$).
- **`VarainceOfX.m`**: Script to study the convergence of the sample variance of a Gaussian random variable to its expected variance.
- **`Alireza Sotoodeh_PJ2.pdf`**: Project report detailing the Gaussian approximation, including methodology, results, and visualizations.

## Objectives and Questions Addressed

The MATLAB scripts address the following key questions related to Gaussian random variables, as outlined in the Probability Engineering course:

1. **Verification of Standard Normal Properties**: Prove that a standard normal random variable ($X \sim N(0,1)$) has a mean of 0 and variance of 1. (`pj2V2.m` computes and displays these statistics.)
2. **Transformation of Gaussian Variables**: Generate a Gaussian random variable $Y = aX + b$ with a specified mean ($\mu = 3$) and variance ($\sigma^2 = 100$), and verify its properties using statistical tests. (`pj2V2.m` implements $Y = \sigma X + \mu$ with $\sigma = \sqrt{100}$ and $\mu = 3$.)
3. **PDF Visualization**: Generate a Gaussian dataset with $\mu = 3$ and $\sigma^2 = 100$, plot its PDF using a histogram (normalized to ensure the area under the curve is 1), and overlay the theoretical Gaussian PDF $f_Y(y) = \frac{1}{\sqrt{2\pi\sigma^2}} e^{-\frac{(y-\mu)^2}{2\sigma^2}}$. (`pj2V2.m` includes histogram and theoretical PDF plots.)
4. **Expected Mean ($E[X]$)**: Analyze the convergence of the sample mean of a Gaussian random variable to its expected mean. (`meanofX.m` plots the sample mean convergence.)
5. **Expected Variance ($E[(X - \mu)^2]$)**: Analyze the convergence of the sample variance of a Gaussian random variable to its expected variance. (`VarainceOfX.m` plots the sample variance convergence.)
6. **Expected Cube ($E[X^3]$)**: Analyze the convergence of the sample mean of $X^3$ for a Gaussian random variable. (`EX3.m` plots the convergence of the mean of $X^3$.)
7. **Statistical Tests**: Perform tests to verify the normality (Anderson-Darling test), mean (t-test), variance (F-test), and independence (autocorrelation) of the generated Gaussian variables. (`pj2V2.m` includes these tests.)

## Detailed Explanation of Scripts

### 1. `pj2V2.m` (Gaussian Random Variable Generation and Analysis)
- **Purpose**: Generates a standard normal random variable $X \sim N(0,1)$, transforms it to $Y = \sigma X + \mu$ with $\mu = 0$ and $\sigma^2 = 100$ (configurable), and visualizes its PDF. Analyzes convergence of mean and variance for $X$ and $Y$, and performs statistical tests.
- **Key Features**:
  - Generates $n = 10,000$ samples of $X \sim N(0,1)$.
  - Transforms to $Y = \sigma X + \mu$ (default: $\mu = 0$, $\sigma^2 = 100$).
  - Plots a histogram of $Y$ (normalized PDF) with 100 bins, overlaid with the theoretical Gaussian PDF.
  - Displays vertical lines for mean ($\mu$), variance ($\sigma^2$), $\pm 1\sigma$ bounds, and sample statistics.
  - Plots convergence of mean and variance for $X$ and $Y$ over increasing sample sizes.
  - Performs statistical tests:
    - **Anderson-Darling Test**: Verifies normality of $Y$.
    - **t-test**: Tests if the mean of $Y$ equals $\mu$.
    - **F-test**: Tests if the variance of $Y$ equals $\sigma^2$.
    - **Autocorrelation**: Checks independence of $Y$ samples (autocorrelation near 0 for non-zero lags).
- **Output**: Two figures:
  - Histogram with theoretical PDF and annotated statistics.
  - Four subplots showing convergence of mean and variance for $X$ and $Y$.

### 2. `meanofX.m` (Mean Convergence Study)
- **Purpose**: Demonstrates that the sample mean of a Gaussian random variable converges to its expected mean.
- **Key Features**:
  - Generates $n = 100,000$ samples with $\mu = 20$ and $\sigma^2 = 50$.
  - Plots the expected mean as a red line and the sample mean (updated every 1000 samples) as a blue line.
  - Prints convergence information when the sample mean is within 0.01 of $\mu$.
- **Output**: A plot showing the sample mean converging to $\mu = 20$.

### 3. `EX3.m` (Cubic Mean Convergence Study)
- **Purpose**: Analyzes the convergence of the sample mean of $X^3$ for a Gaussian random variable.
- **Key Features**:
  - Generates $n = 100,000$ samples with $\mu = 3$ and $\sigma^2 = 12$.
  - Computes the mean of $X^3$ for increasing sample sizes (10 to 100,000, step 10).
  - Plots the expected mean of $X^3$ (red line) and the sample mean of $X^3$ (blue line, updated every 1000 samples).
  - Prints convergence information when the sample mean of $X^3$ is within 0.01 of $\mu^3$.
- **Output**: A plot showing the convergence of the sample mean of $X^3$.

### 4. `VarainceOfX.m` (Variance Convergence Study)
- **Purpose**: Demonstrates that the sample variance of a Gaussian random variable converges to its expected variance.
- **Key Features**:
  - Generates $n = 100,000$ samples with $\mu = 0$ and $\sigma^2 = 22$.
  - Plots the expected variance as a red line and the sample variance (updated every 1000 samples) as a blue line.
  - Prints convergence information when the sample variance is within 0.01 of $\sigma^2$.
- **Output**: A plot showing the sample variance converging to $\sigma^2 = 22$.

### 5. `Alireza Sotoodeh_PJ2.pdf` (Project Report)
- **Purpose**: Summarizes the MATLAB simulations for the Gaussian approximation project.
- **Content**: Includes the project title, topic ("The Gaussian approximation"), course details, authorship, and university affiliation. Features visualizations and explanations of the Gaussian random variable simulations, likely including results from the MATLAB scripts.

## How to Use

1. **Prerequisites**: MATLAB (tested with versions supporting `randn`, `histcounts`, `adtest`, `ttest`, `vartest`, etc.).
2. **Running the Scripts**:
   - Run `pj2V2.m` to generate and analyze a Gaussian random variable, visualize its PDF, and perform statistical tests.
   - Run `meanofX.m` to study mean convergence.
   - Run `EX3.m` to study cubic mean convergence.
   - Run `VarainceOfX.m` to study variance convergence.
3. **Customization**:
   - Modify parameters like `n` (number of samples), `mu` (mean), and `main_var` (variance) in `pj2V2.m`.
   - Adjust plot limits (`xlim1`, `xlim2`, `ylim1`, `ylim2`) or histogram bins (`num_bins`) in `pj2V2.m`.
   - Change sample sizes or statistical parameters in `meanofX.m`, `EX3.m`, or `VarainceOfX.m`.

## Example Output
- **Histogram and PDF Plot** (from `pj2V2.m`): Shows the normalized histogram of $Y$ with the theoretical Gaussian PDF, annotated with mean, variance, and $\pm 1\sigma$ lines.
- **Convergence Plots**:
  - `meanofX.m`: Sample mean converging to $\mu = 20$.
  - `EX3.m`: Sample mean of $X^3$ converging to $\mu^3$.
  - `VarainceOfX.m`: Sample variance converging to $\sigma^2 = 22$.
- **Statistical Test Results**: Printed to the MATLAB command window, confirming normality, mean, variance, and independence.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact
For questions or contributions, contact Alireza Sotoodeh via GitHub or email (if provided). Feel free to open issues or pull requests for improvements.

---
*Author: Alireza Sotoodeh, Shahid Bahonar University of Kerman*
