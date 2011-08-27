# Contributor: Firmicus <firmicus āt gmx dōt net>

pkgname=tec-kit
pkgver=2.5.1
_pkgver=2_5_1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Text Encoding Conversion Kit from SIL.org"
url="http://scripts.sil.org/teckit"
license="LGPL"
depends=('expat')
source=(http://scripts.sil.org/svn-view/teckit/TAGS/TECkit_${_pkgver}.tar.gz)
md5sums=('4913f71f0f42bfd9cf8f161688b35dea')

build() {
  cd $startdir/src/TECkit_${_pkgver} || return 1
  chmod a+x configure || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
