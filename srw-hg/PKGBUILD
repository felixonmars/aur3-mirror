# Maintainer: moyamo <moyamodehacker@gmail.com>
pkgname='srw-hg'
pkgver=r89.295139501255
pkgrel=1
pkgdesc="A simple read wrapper."
arch=('i686' 'x86_64')
url="http://bitbucket.org/emg/srw"
license=('MIT')
depends=()
makedepends=('mercurial')
provides=(srw)
conflicts=(srw)
source=("srw::hg+https://bitbucket.org/emg/srw/")
sha256sums=('SKIP')

build() {
  cd srw/
  make
}

pkgver() {
  cd srw/
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd srw/
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE \
	"$pkgdir/usr/share/licenses/$pkgname/license.txt"
} 
