# Maintainer: Mark Agarunov <Tiksi@packetfire.org>
pkgname=whatmask
pkgver=1.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Whatmask is a small C program that will help you with network settings. Calculates CIDR and subnets in multiple formats"
url="http://www.laffeycomputer.com/whatmask.html"
license=('GPL')
source=('http://downloads.laffeycomputer.com/current_builds/whatmask/whatmask-1.2.tar.gz' 'http://downloads.laffeycomputer.com/current_builds/whatmask/whatmask-1.2.tar.gz.asc')
sha256sums=() #autofill using updpkgsums
md5sums=('26aeff74dbba70262ccd426e681dcf4a' 'SKIP')
validpgpkeys=('36C264F5A8B595380BE2EBE86092764DE8882FE3')

build() {
  cd "$pkgname-$pkgver"
  
  unset CPPFLAGS
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
