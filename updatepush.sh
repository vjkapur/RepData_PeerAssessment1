# This script compiles the assignment Rmd file into both markdown and html, and adds/commits/remote-pushes the results
# The script takes one parameter: a comment for the commit
# usage: ./updatepush.sh "this a commit message"
Rscript -e "library(knitr); knit('PA1_template.Rmd'); knit2html('PA1_template.Rmd')"
git add PA1_*
git add figure/*
git commit -m "$1"
git push origin master
