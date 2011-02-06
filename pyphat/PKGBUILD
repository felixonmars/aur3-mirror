# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=pyphat
pkgver=0.4.1
pkgrel=2
pkgdesc="Python bindings for phat"
arch=('i686' 'x86_64')
url="http://phat.berlios.de/"
license=('GPL2')
depends=('python2' 'phat' 'pygtk')
options=('!libtool')
source=("http://download.berlios.de/phat/$pkgname-$pkgver.tar.gz")
md5sums=('8c1352564e5668cc1b33a36b2466d4aa')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  export PYTHON="python2"

  ./configure --prefix=/usr
  make
}

package() {

  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install 
}
