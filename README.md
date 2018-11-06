[![DOI](https://zenodo.org/badge/139232784.svg)](https://zenodo.org/badge/latestdoi/139232784)


# Multifractal analysis of actigraphy data 

This repository contains all routines to generate the figures of the article 'On multifractals: a non-linear study of actigraphy data'.

:warning: Please reference the following paper if you use or adapt any of the materials available here:

:newspaper: França, L. G. S., Montoya, P., & Miranda, J. G. V. (2018). On multifractals: A non-linear study of actigraphy data. Physica A: Statistical Mechanics and Its Applications. https://doi.org/10.1016/J.PHYSA.2018.09.122 [arXiv:1702.03912](https://arxiv.org/abs/1702.03912).

## Download

```
git clone https://github.com/lucasfr/actiMF
```

## Docker containers

To guarantee reproducibility and reduce issues involved in solving dependencies, all the routines available here run in a Docker container. Please download the last version of the software at their website: https://www.docker.com/

To run the Docker container with the defined settings, please run:

```
docker-compose up -d
```

## Multifractal Analysis

```
docker-compose exec rstudio /bin/sh -c "./runMF.sh"
```

Chhabra-Jensen approach routine can be employed in the analysis of different time series with the following command:

```
./mgran file_to_parse q_measures_extension alpha_measures_extension -q +q q_steps max_dyadic_scale R2-q R2-alpha summary_or_spectra ignore_scales >> output_file
```

## Figures

All figures are in an R Markdown document to ease visualisation. Open the link http://localhost:8787 and then the file actiMF.Rmd when the RStudio loads.

:warning: The login and password are 'rstudio' and 'letmein', respectively.

## Stopping containers

When you are finished with your analysis stop the Docker container with the command:

```
docker-compose kill rstudio
```

## Patient information table

| Patient | Gender | Age   | BMI   | Group | Painkillers | Anxiolytics | Antidepressants |
|---------|--------|-------|-------|-------|-------------|-------------|-----------------|
| 000     | F      | 28.76 | 23.53 | HC    | No          | No          | No              |
| 030     | F      | 35.86 | 22.50 | HC    | No          | No          | No              |
| 040     | F      | 24.68 | 21.63 | HC    | No          | No          | No              |
| 050     | F      | 25.01 | 18.96 | HC    | No          | No          | Yes             |
| 060     | F      | 30.29 | 20.94 | HC    | No          | No          | No              |
| 070     | F      | 36.02 | 20.76 | HC    | No          | No          | No              |
| 080     | F      | 26.33 | 20.69 | HC    | No          | No          | No              |
| 100     | F      | 44.70 | 24.84 | HC    | No          | No          | No              |
| 110     | F      | 41.88 | 21.49 | HC    | No          | No          | No              |
| 120     | F      | 31.94 | 18.71 | HC    | No          | No          | No              |
| 140     | F      | 48.69 | 25.56 | HC    | No          | No          | No              |
| 150     | F      | 42.61 | 18.86 | HC    | No          | No          | No              |
| 160     | F      | 46.66 | 24.51 | HC    | No          | No          | No              |
| 001     | F      | 56.97 | 25.59 | HC    | No          | No          | No              |
| 011     | F      | 57.69 | 23.59 | HC    | No          | No          | Yes             |
| 021     | F      | 54.64 | 25.63 | HC    | No          | No          | No              |
| 031     | F      | 56.14 | 22.31 | HC    | No          | No          | No              |
| 041     | F      | 71.75 | 24.34 | HC    | No          | No          | No              |
| 051     | F      | 57.25 | 26.78 | HC    | No          | No          | No              |
| 061     | F      | 58.78 | 25.63 | HC    | No          | No          | No              |
| 071     | F      | 57.34 | --    | HC    | No          | No          | No              |
| 091     | F      | 70.11 | --    | HC    | No          | No          | No              |
| 101     | F      | 61.36 | 21.23 | HC    | No          | No          | No              |
| 111     | F      | 57.26 | 20.40 | HC    | No          | Yes         | Yes             |
| 121     | F      | 58.97 | 20.20 | HC    | No          | No          | No              |
| 141     | F      | 57.26 | 21.22 | HC    | No          | No          | No              |
| 151     | F      | 57.40 | 23.71 | HC    | No          | No          | No              |
| 500     | F      | 43.17 | 29.02 | FM    | Yes         | Yes         | Yes             |
| 510     | F      | 41.81 | 30.48 | FM    | Yes         | Yes         | Yes             |
| 520     | F      | 40.98 | 27.92 | FM    | Yes         | No          | Yes             |
| 530     | F      | 31.13 | 29.03 | FM    | Yes         | Yes         | Yes             |
| 560     | F      | 41.71 | 20.58 | FM    | Yes         | Yes         | No              |
| 570     | F      | 34.51 | 23.71 | FM    | Yes         | No          | No              |
| 580     | F      | 29.97 | 23.34 | FM    | Yes         | No          | No              |
| 600     | F      | 38.52 | NA    | FM    | NA          | NA          | NA              |
| 610     | F      | 41.99 | 24.45 | FM    | Yes         | Yes         | Yes             |
| 620     | F      | 37.56 | 35.42 | FM    | Yes         | Yes         | Yes             |
| 630     | F      | 46.57 | 20.90 | FM    | Yes         | Yes         | Yes             |
| 640     | F      | 49.04 | 23.62 | FM    | No          | No          | No              |
| 650     | F      | 46.12 | 27.04 | FM    | Yes         | Yes         | Yes             |
| 501     | F      | 60.71 | 20.03 | FM    | Yes         | Yes         | Yes             |
| 511     | F      | 61.83 | 22.84 | FM    | Yes         | Yes         | Yes             |
| 521     | F      | 50.47 | 24.97 | FM    | NA          | NA          | NA              |
| 531     | F      | 58.99 | 25.54 | FM    | Yes         | Yes         | Yes             |
| 541     | F      | 56.39 | 25.89 | FM    | Yes         | Yes         | Yes             |
| 551     | F      | 52.24 | 25.53 | FM    | No          | Yes         | Yes             |
| 561     | F      | 46.62 | 27.64 | FM    | Yes         | Yes         | Yes             |
| 571     | F      | 58.31 | 34.93 | FM    | Yes         | No          | Yes             |
| 581     | F      | 50.50 | 36.15 | FM    | Yes         | Yes         | Yes             |
| 601     | F      | 56.45 | 28.00 | FM    | Yes         | Yes         | Yes             |
| 611     | F      | 60.93 | 23.05 | FM    | Yes         | Yes         | Yes             |
| 621     | F      | 54.94 | 27.82 | FM    | Yes         | Yes         | Yes             |
| 631     | F      | 57.63 | 39.04 | FM    | Yes         | Yes         | Yes             |
| 641     | F      | 56.95 | 26.04 | FM    | Yes         | No          | No              |

## LICENSE

This software is licensed under an MIT License. 

Copyright (c) 2018 [Lucas G S França](https://lucasfr.github.io/), [Pedro Montoya](http://pedromontoya.com/), José G V Miranda. 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
