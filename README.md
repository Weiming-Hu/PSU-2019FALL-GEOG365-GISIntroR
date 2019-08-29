# GEOG 365 Introduction to GIS Programming

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Weiming-Hu/PSU-2019FALL-GEOG365-GISIntroR/master)

<!-- vim-markdown-toc GitLab -->

* [Overview](#overview)
* [Setup Instructions](#setup-instructions)
    * [Increase Your Storage Space (For Penn State Students)](#increase-your-storage-space-for-penn-state-students)
    * [Install R and RStudio](#install-r-and-rstudio)
    * [Install LaTex](#install-latex)
    * [Install GIT](#install-git)
    * [Working with Markdown](#working-with-markdown)
* [Issues](#issues)

<!-- vim-markdown-toc -->

## Overview

Welcome to the repository for GEOG 365, Introduction to GIS Programming, during 2019 Fall semester at Penn State.

Instructor: [Weiming Hu](https://weiming-hu.github.io/)

Didn't have your machine already set up? Use a pre-built machine dedicated for this course at [Binder](https://mybinder.org/v2/gh/Weiming-Hu/PSU-2019FALL-GEOG365-GISIntroR/master), or click the `Launch | Binder` badge above. Usually, it takes about 3 minutes to launch a server for you. But, depending on the workload of installing required packages, it can take about 10 minutes if a new image needs to be built. You can first click the badge/link which launches the building process and you can come back after a while to check. **Feel free to experiment with the scripts, changes won't be reflected in this public repository**.  

## Setup Instructions

This document walks you through the steps to set up your environment for GEOG 365, Introduction to GIS Programming.

### Increase Your Storage Space (For Penn State Students)

If you are using the lab desktops, you might run into issues on insufficient storage space if you are trying to install packages. This is because you are initially given 500 MB of online storage space; however, you may increase your storage allocations to 10GB. More information can be found [here](https://sites.comm.psu.edu/itsupport/pass-space-u-drive/).

To increase your disk quota, please follow the steps:

1. Log in onto the [IT Secure Server](https://sites.comm.psu.edu/itsupport/pass-space-u-drive/).
2. You will see a panel on the left under **Penn State Access Account Storage Space (PASS) Information**.
3. Change the quota to **10.0GB** which is the maximum allowed, and then click `change` to confirm the change.

You should be able to install more packages on lab desktops now. But again, keep large files on your own flash drives in order to save your space.

### Install R and RStudio

**You do not need to install R and RStudio on lab desktop because they are already installed**. If you are using your own machines and this is your first time working with R, probably you need to install R and RStudio.

Depending on your operation system, you have different steps to install them. `Google` generally gives you a good solution for the installation. If you have problems installing, please come and find me.

### Install LaTex

Assignments will be preferred in the format of PDF. I have mentioned about using R markdown in the class to generate PDF/HTML files directly from the script. If you decide to use alternatives, e.g. Microsoft Word, and then convert them to PDF manually, you do not have to install LaTex.

Some of you had the experience that, when you are using `html_document` rather than `pdf_document`, the `knit` process went through and you get an HTML file. The reason `pdf_document` was not working is that the program, [LaTex](https://www.latex-project.org/), is missing and this program is required to convert from R markdown code into PDF file.

Of course, if you do not want to install `LaTex`, you can always take the HTML file to an [online HTML-to-PDF converter](https://html2pdf.com/) and generate a PDF file manually.

But, since we are learning about programming, I would suggest you automate this process and save your future troubles. Please Google how to install `LaTex` on your specific machine.

If you need help, please come and find me.

If you are using the lab desktops, you do not have the permission to install programs on the computers. I'm talking with our IT support to help us install the program.

### Install GIT

Since the course materials are also public on [GitHub](https://github.com/Weiming-Hu/PSU-2019FALL-GEOG365-GISIntroR), instead of downloading the repository every time I make a change to it, you can integrate `GitHub` into `RStudio` by installing [git](https://git-scm.com/). Then you will have the ability to click one button and sync your local directory with the online repository.

### Working with Markdown

Most of the materials will be in the format of R Markdown. Essentially, R Markdown is Markdown plus R code. You can write pure Markdown file and there are plenty of editors for Markdown language. Here are two online editors that are easy to use if you just want to write pure Markdown files. When you type in the left panel, you can see in real-time how the compiled format looks like in the right panel.

- [Dillinger](https://dillinger.io/) starts with an example for you to play with.
- [Markdown Editor](https://jbt.github.io/markdown-editor/) starts with a blank document.

## Issues

Found an issue? Please open an ticket.

Thank you.

```
# "`-''-/").___..--''"`-._
#  (`6_ 6  )   `-.  (     ).`-.__.`)   WE ARE ...
#  (_Y_.)'  ._   )  `._ `. ``-..-'    PENN STATE!
#    _ ..`--'_..-_/  /--'_.' ,'
#  (il),-''  (li),'  ((!.-'
# 
# Authors: 
#     Weiming Hu <weiming@psu.edu>
#
# Geoinformatics and Earth Observation Laboratory (http://geolab.psu.edu)
# Department of Geography and Institute for CyberScience
# The Pennsylvania State University
```
