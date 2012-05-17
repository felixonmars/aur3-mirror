# Maintainer: Vianney le Clément <vleclement AT gmail·com>
pkgname=eid-viewer
_version=4.0.2
_revision=132
pkgver=$_version.$_revision
pkgrel=1
pkgdesc="Viewer for Belgian Electronic Identity Card"
arch=(any)
url="https://code.google.com/p/eid-viewer/"
license=('LGPL3')
depends=('java-runtime' 'pcsclite')
makedepends=('subversion')
source=(https://$pkgname.googlecode.com/files/$pkgname-$_version-$_revision.src.tar.gz)
md5sums=('5228e2aa1f6caf9bdc6d30cda57bdc40')
sha1sums=('62090fc0b603379a3e8abd6662f381e00dde2469')

build() {
  cd "$srcdir/$pkgname-$_version"
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$_version"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
