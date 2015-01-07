pkgname=stoken-git
pkgver=v0.81.r0.ge0595f1
pkgrel=1
pkgdesc="RSA Software Token for Linux"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/cernekee/stoken/"
depends=('libxml2')
makedepends=('git')
sha1sums=('SKIP')
source=($pkgname::git://github.com/cernekee/stoken.git)
 
pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-shared \
              --without-gtk \
              --without-tomcrypt
  make
}
 
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
