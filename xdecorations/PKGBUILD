# Maintainer: Dany Martineau <dany.luc.martineau[at]gmail[dot]com>
pkgname=xdecorations
_pkgname=XDecorations
pkgver=0.1.7
pkgrel=1
pkgdesc="Some eye candy for the holidays."
url="http://keithhedger.hostingsiteforfree.com/pages/xdecorations/xdecorations.html"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libxpm' 'imlib2')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install=''
source=("https://dl.dropboxusercontent.com/s/xxqhohn34yr2ybp/${_pkgname}-${pkgver}.tar.gz")

md5sums=('37c5d33a09fd3e7992c78f21a2e610c2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
