# Maintainer: tasos latsas <tlatsas2000@gmail.com>
# Contributor: rabyte <rabyte*gmail>

pkgname=gmanedit
pkgver=0.4.2
pkgrel=1
pkgdesc="A GNOME/GTK2 editor for Linux manpages"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gmanedit2/"
license=('GPL2')
depends=('gtk2>=2.10')
makedepends=('pkgconfig>=0.9')
source=(http://downloads.sourceforge.net/gmanedit2/$pkgname-$pkgver.tar.gz)
md5sums=('7d4989c762ef3ef1291fd7bccdf8e9be')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
