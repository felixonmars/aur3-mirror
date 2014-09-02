# Maintainer: snafu <snafu21@user.sourceforge.net>
pkgname=mandelbrot-gtk
pkgver=0.4
pkgrel=1
pkgdesc="A multithreaded GTK3 application for rendering the mandelbrot and julia set"
arch=('i686' 'x86_64')
url="http://mandelbrot-gtk.sourceforge.net"
license=('GPL3')
groups=()
depends=('gtk3' 'libxml2')
makedepends=('pkg-config')
provides=('mandelbrot-gtk')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/mandelbrot-gtk/files/linux_releases/$pkgname-$pkgver-$pkgrel.tar.bz2)
noextract=()
md5sums=('8a49e6b84aa1df2ccf4e88eb96fc90bf')

build() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
