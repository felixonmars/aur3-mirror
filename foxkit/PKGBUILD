# Contributor: TDY <tdy@archlinux.info>
# Contributor: adriano <adriano.src@gmail.com>

pkgname=foxkit
pkgver=0.0.5
pkgrel=8
pkgdesc="A QtWebKit web browser"
arch=('i686' 'x86_64')
url="http://code.google.com/p/foxkit/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('automoc4' 'cmake')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-x86_64.diff)
sha256sums=('d67a8bf1001da9614ea9ef088bdf74aef4c76bd98cf9d446bcabee49a464acab'
            '81cce81fccb68909e10cd6c64609499a366eec8ad29d6969268426987d6d89dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ $CARCH == x86_64 ]] && patch -Np1 -i ../$pkgname-$pkgver-$CARCH.diff
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=/usr/lib/qt4/bin/qmake \
        -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 src/foxkitui.rc "$pkgdir/opt/kde/share/apps/foxkit/foxkitui.rc"
}

# vim:set ts=2 sw=2 et:
