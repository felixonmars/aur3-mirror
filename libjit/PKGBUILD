# Contributor: Your Name <youremail@domain.com>
# maintainer perlawk
pkgname=libjit
pkgver=0.1.2
pkgrel=1
pkgdesc="LibJIT is a library that provides generic Just-In-Time compiler functionality independent of any particular bytecode, language, or runtime."
arch=('i686' 'x86_64')
url="http://freecode.com/projects/libjit"
license=('LGPL')
backup=()
source=("http://ftp.gnu.org/old-gnu/dotgnu/libjit/$pkgname-$pkgver.tar.gz")
md5sums=('9e0c1986da9a03ce68cfb3021bbc6701')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
