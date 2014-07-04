# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=ding-libs
pkgver=0.4.0
pkgrel=1
pkgdesc="'D is not GLib' utility libraries"
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/git/ding-libs.git"
license=('GPL3')
makedepends=('doxygen')
source=("https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tar.gz.asc")
sha1sums=('38d9ebb0e44dfb7a8d97c2f650a586260c8909f9' SKIP)
validpgpkeys=('7B54CAE8A03D66F3D70A5B516F5A90EB44FBC7C7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
} 

# vim: ts=2:sw=2:et
