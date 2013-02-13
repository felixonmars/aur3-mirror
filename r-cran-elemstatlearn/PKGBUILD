# Maintainer: Francois Garillot <francois[@]garillot.net>
pkgname=r-cran-elemstatlearn
pkgver=2012.04_0
pkgrel=1
pkgdesc="Data sets, functions and examples from the book: The Elements of Statistical Learning, Data Mining, Inference, and Prediction by Trevor Hastie, Robert Tibshirani and Jerome Friedman."
url="http://cran.r-project.org/web/packages/ElemStatLearn/index.html"
license=('GPL (>= 2)')
arch=('i686' 'x86_64')
makedepends=('gcc' 'gcc-fortran')
depends=('r' )
optdepends=('r-cran-lars' 'r-cran-prim' 'r-cran-mda' 'r-cran-gam' 'r-cran-leaps' 'r-cran-earth' 'r-cran-lasso2')
source=(http://cran.r-project.org/src/contrib/ElemStatLearn_2012.04-0.tar.gz)
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ElemStatLearn -l ${pkgdir}/usr/lib/R/library
    for lic in "LICENSE" "LICENCE" "COPYING"; do
        if [ -f ${srcdir}/ElemStatLearn/${lic} ]; then
            install -Dm644 ${srcdir}/ElemStatLearn/${lic} ${pkgdir}/usr/share/licenses/r-cran-elemstatlearn/${lic}
        fi
    done
}
md5sums=('8cc12c08b77f919d4552a607fb432c6e')
