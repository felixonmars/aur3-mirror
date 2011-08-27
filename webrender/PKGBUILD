# Mantainer: Mariano Copetti <marianocopetti@gmail.com>

pkgname=webrender
pkgver=1.0RC
pkgrel=1
pkgdesc="WebRender is very simple, fast web browser based on Qt and WebKit"
arch=('i686' 'x86_64')
url="http://webrender.99k.org/"
license=('GPL')
depends=('qt')
makedepends=()
provides=()
conflicts=()
source=(http://webrender.99k.org/download/Source/WebRender-$pkgver.tar.bz2 webrender.desktop)
md5sums=(ba480b734ddfd94af0b40b73e8f16110 1708fefe3c9ccbb1f6e4c81de4569d3a)


build() {
cd $srcdir/$pkgname-$pkgver
qmake
make || return 1
install -D -m755 webrender $startdir/pkg/usr/bin/webrender
install -D -m644 icons/webrender.png $startdir/pkg/usr/share/pixmaps/webrender.png
install -D -m644 icons/webrender2.png $startdir/pkg/usr/share/pixmaps/webrender2.png
install -D -m644 $srcdir/webrender.desktop $startdir/pkg/usr/share/applications/qtmpc.desktop
}