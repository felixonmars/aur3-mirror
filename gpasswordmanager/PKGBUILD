# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=gpasswordman
pkgver=2.4.0
pkgrel=1
pkgdesc="Simple, lightweight password manager"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gpasswordman/"
license='APACHE'
depends=('crypto++' 'qt')
source=(http://sourceforge.net/projects/gpasswordman/files/source/${pkgname}_v${pkgver}.zip)
md5sums='7bddf895a3ede4b0bb1cd4fe8656bd9b'

build() {
  cd $srcdir

  # Build
  qmake "QMAKE_CXXFLAGS+=-fpermissive"
  make

  # Binary
  install -Dm755 Main/Main $pkgdir/usr/bin/$pkgname

  # Desktop icon
  install -Dm644 resources/icons/main.png  $pkgdir/usr/share/pixmaps/gpasswordman.png
  install -Dm644 ../gpasswordman.desktop $pkgdir/usr/share/applications/gpasswordman.desktop
}
