# Contributor: Ross Melin <rdmelin@gmail.com>

pkgname=gimp-plugin-deskew
pkgver=1.1
pkgrel=1
pkgdesc="Auto straighten lines of text in scanned documents"
arch=('i686')
url="http://www.cubewano.org/gimp-deskew-plugin/"
license=('GPL')
depends=('gimp')

source=("http://www.cubewano.org/gimp-deskew-plugin/downloads/1.1.0/gimp-deskew-plugin_$pkgver.tar.gz")
md5sums=('c02639944c4a8ae33cc4ff5960a13f7f')

build() {
  cd "$srcdir/trunk"
  autoconf
  automake --add-missing
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  # hack to correct broken make --install 
  mv $pkgdir/usr/usr/lib $pkgdir/usr/
  rmdir $pkgdir/usr/usr
}

# vim:set ts=2 sw=2 et:

