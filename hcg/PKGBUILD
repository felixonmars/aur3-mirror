pkgname=hcg
pkgver=6.0
pkgrel=2
pkgdesc="A calculator with lots of options, abundant functions and a small programming language"
arch=('i686' 'x86_64' 'armv6h')
url="http://houbysoft.com/hc/"
license=('GPL3')
depends=('mapm' 'qt4' 'plplot')
source=("http://houbysoft.com/download/$pkgname-$pkgver-src.tar.gz" "hcg.desktop")
md5sums=('f88700c950bd587e6204a7211a5d6090' '7c70a281419ca652783aefc0b1668184')

build() {
  cd  $srcdir/$pkgname-$pkgver-src/qtgui
  qmake-qt4 || return 1
  make || return 1
  install -D HCG "$pkgdir/usr/bin/$pkgname"
  install -D -m644 ../README "$pkgdir/usr/share/$pkgname/README"
  install -D -m644 ../LICENSE "$pkgdir/usr/share/$pkgname/LICENSE"
  install -D -m644 $srcdir/hcg.desktop "$pkgdir/usr/share/applications/hcg.desktop"
}
