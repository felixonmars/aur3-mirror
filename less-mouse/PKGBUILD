# This package is based on the original less package from ABS
# Patch by ararus from http://www.linuxquestions.org
# (view post http://www.linuxquestions.org/questions/linux-software-2/less-command-output-i-cannot-scroll-through-it-627821/page2.html?s=3b5e6292d15fca5f10cd901a9bf6c9f2#post3094148)
# edited by lxyd <lobster@hotmail.ru> and harryNID
# changes made to the original patch:
# - no environment vars needed
# - default scroll is _3_ lines
# - Ctrl+scroll scrolls half a page

pkgname=less-mouse
_pkgname=less
pkgver=471
pkgrel=1
pkgdesc="A terminal based program for viewing text files with mouse scroll"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://www.greenwoodsoftware.com/less"
depends=('ncurses' 'pcre')
makedepends=('patch')
provides=('less')
conflicts=('less')
source=(http://www.greenwoodsoftware.com/less/less-$pkgver.tar.gz less-mouse-471.patch)
sha256sums=('37f613fa9a526378788d790a92217d59b523574cf7159f6538da8564b3fb27f8'
            '3fadc7fe4f03d0fb7a785c6744fea2d21302225e58eb953e7591ae95da0f49bf')

prepare() {
 cd "${srcdir}"/${_pkgname}-${pkgver}
 chmod -R +w *
 patch -Np1 -i ../less-mouse-471.patch
}

build() {
  cd ${srcdir}/less-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --with-regex=pcre
  make 
}
package() {
  cd "${srcdir}/less-${pkgver}"
  make prefix="${pkgdir}"/usr install
}
