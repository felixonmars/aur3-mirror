# Contributor: roughl
pkgname=osxcart
pkgver=1.0
pkgrel=1
pkgdesc="OS X Converting And Reading Tool is a library designed to import file formats used in Mac OS X, NeXTSTEP and GnuSTEP into GTK+/GLib-based programs easily. Examples: proberty lists, RTF and RTFD documents"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/osxcart/"
license=('GPL')
depends=('cairo' 'gtk2')
source=(http://sourceforge.net/projects/osxcart/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('cf2b799d9c6be1883bb55a4f92c07112')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

# vim:set ts=4 sw=4 et:

