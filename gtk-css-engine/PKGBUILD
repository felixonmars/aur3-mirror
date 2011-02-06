# Contributor: Leonid Selivanov <bravebug at gmail dot com>

pkgname=gtk-css-engine
pkgver=0.3.1
pkgrel=1
pkgdesc="The CSS Theme Engine for GTK+"
arch=('i686' 'x86_64')
url="http://www.gnome.org/~robsta/gtk-css-engine/"
license=('GPL3')
groups=()
depends=('gtk' 'ccss>=0.5.0')
makedepends=()
optdepends=()
provides=('gtk-css-engine=$pkgver')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ftp.gnome.org/pub/GNOME/sources/gtk-css-engine/0.3/$pkgname-$pkgver.tar.bz2)
noextract=()
sha256sums=('c1d0000e00516b50f976db7726cd3f5e6318182704ad04be980d4ec7731e75d4')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

