# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Cedric Mathieu <me.xenom@gmail.com>

pkgname=gnome-color-chooser
pkgver=0.2.5
pkgrel=2
pkgdesc="A GTK+/GNOME desktop appearance customization tool"
arch=('i686' 'x86_64')
url="http://gnomecc.sourceforge.net/"
license=('GPL')
depends=('libglademm>=2.6.0' 'libgnomeui>=2.14.0')
makedepends=('intltool>=0.35.5')
optdepends=('gtk-engines: more customizable theme engines')
source=(http://downloads.sourceforge.net/gnomecc/$pkgname-$pkgver.tar.bz2)
md5sums=('505f41944c84aa970232638ce2c46dfd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
