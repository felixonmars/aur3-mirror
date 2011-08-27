# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=qtagconvert
pkgver=2.0.0
pkgrel=3
pkgdesc="Tag editor for mp3 files. Designed to convert codepage for ID3v1 and ID3v2 tags"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/${pkgname}"
license=('GPL2')
depends=('qt' 'taglib')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('61178ce6f13c9f0b955f683a94d1baf9')

build() {
  cd $srcdir/$pkgname-$pkgver

  lupdate qtagconvert.pro -ts locale/qtagconvert_ru.ts || return 1
  lrelease locale/qtagconvert_ru.ts -qm locale/qtagconvert_ru.qm || return 1

  qmake -r PREFIX="/usr" QMAKE_CXXFLAGS="$CXXFLAGS" || return 1
  make || return 1
  make INSTALL_ROOT=$pkgdir install

}

# vim:set ts=2 sw=2 et:
