# Contributor: Orivej Desh <orivej@gmx.fr>
# Maintainer: Orivej Desh <orivej@gmx.fr>

pkgname=fbreader-qt4
pkgver=0.12.10
pkgrel=1
pkgdesc="An e-book reader for Linux"
arch=('i686' 'x86_64')
url="http://fbreader.org/"
license=('GPL')
depends=('fribidi' 'liblinebreak' 'qt' 'curl' 'bzip2')
source=("http://www.fbreader.org/files/sources/fbreader-sources-$pkgver.tgz" "desktop.mk.patch" "c++.patch")
md5sums=('da9ec4721efdb0ec0aaa182bff16ad82'
         '35b7c625e46ef1ac499b58dad0144eb0'
         '9e4da0073aad1a340673328ce48f2577')

build() {
  export TARGET_ARCH=desktop
  export UI_TYPE=qt4
  export TARGET_STATUS=release

  cd "$srcdir/fbreader-$pkgver"
  patch -Np1 -i ../desktop.mk.patch
  patch -Np1 -i ../c++.patch
  make INSTALLDIR=/usr
  make INSTALLDIR=/usr DESTDIR="$pkgdir" install
}
