# Convert R markdown files to ipynb

Tools to be used:

- [ipyrmd](https://github.com/chronitis/ipyrmd)
- [IRkernel](https://github.com/IRkernel/IRkernel)

Create a virtual environment with python 3.

```
virtualenv -p python3 envname
source envname/bin/activate
```

Install required tools.

```
pip install jupyter nbformat pyyaml ipyrmd 
R -e "install.packages('IRkernel')"
R -e "IRkernel::installspec()"
```

Convert Rmd to ipynb.

```
for file in `ls *.Rmd`; do ipyrmd --t ipynb --from Rmd -o `basename $file .Rmd`.ipynb $file -y; done
```
