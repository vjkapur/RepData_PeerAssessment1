Rscript -e "library(knitr); knit('PA1_template.Rmd'); knit2html('PA1_template.Rmd')"
git add PA1_*
git add figure
git commit -m "$1"
git push origin master
