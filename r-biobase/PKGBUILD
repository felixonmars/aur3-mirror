pkgname=r-biobase
pkgver=2.12.1
pkgrel=1
pkgdesc="Biobase Library for the GNU R language"
bioconductor_ver=2.8
arch=('i686' 'x86_64')
url="http://www.bioconductor.org/"
license=("Artistic-2.0")
depends=('r')
source=(http://www.bioconductor.org/packages/${bioconductor_ver}/bioc/src/contrib/Biobase_${pkgver}.tar.gz)
md5sums=('893dc8abd60e3cebae58a000ffb15288')
options=('!libtool' '!emptydirs')

build() {
 cd ${startdir}/src
 mkdir -p ../pkg/usr/lib/R/library
 R CMD INSTALL Biobase -l ../pkg/usr/lib/R/library
 rm ${startdir}/pkg/usr/lib/R/library/R.css

}
