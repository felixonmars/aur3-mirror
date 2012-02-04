# Contributor: Ismael Carnales <icarnales@gmail.com>
pkgname=dmenu-xinerama
pkgver=3.9
pkgrel=1
pkgdesc="A generic and efficient menu for X, with Xinerama support"
arch=('i686' 'x86_64')
url="http://www.suckless.org/programs/dmenu.html"
license=('MIT')
depends=('libx11' 'libxinerama')
conflicts=('dmenu')
provides=('dmenu')
source=(http://code.suckless.org/dl/tools/dmenu-$pkgver.tar.gz dmenu.patch)
md5sums=('36d546dd4ac21660b20cdb056f5cb341'
         'd74a6665a19cb0403720f1f3abcd280d')

build() {
  cd "$srcdir/dmenu-$pkgver"

  patch -Np1 -i ../dmenu.patch || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  #install license
  install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/dmenu/COPYING
}
