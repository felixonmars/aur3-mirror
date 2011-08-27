# Maintainer: Jan Lipovsky <janlipovsky [at] gmail [dot] com>
# Contributor: Jan Lipovsky <janlipovsky [at] gmail [dot] com>

pkgname=gncpmount
pkgver=0.0.4
pkgrel=1
pkgdesc="Graphical user interface (GUI) for ncpmount"
arch=('i686' 'x86_64')
url="http://gncpmount.lipoja.net"
license=('GPL3')
groups=()
depends=('ncpfs' 'gtk3>=3.0.10')
makedepends=('gtk3>=3.0.10' 'glib2>=2.28.6' 'gdk-pixbuf2' 'gettext' 'gnome-common')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=gncpmount.install
changelog=ChangeLog
source=($pkgname-$pkgver.tar.gz::http://lipoja.fedorapeople.org/gncpmount/download/gncpmount-0.0.4.tar.gz)
noextract=()
md5sums=(051132284f34c581661165901dc9351c) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export NOCONFIGURE=1;
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
