# Maintainer: TDY <tdy@gmx.com>

pkgname=rsbac-admin
pkgver=1.4.3
pkgrel=1
pkgdesc="Management utilities for the Rule Set Based Action Control framework"
arch=('i686' 'x86_64')
url="http://www.rsbac.org/"
license=('GPL')
depends=('dialog' 'pam')
makedepends=('findutils')
options=('!libtool')
install=$pkgname.install
source=(ftp://rsbac.org/download/code/$pkgver/$pkgname-$pkgver.tar.bz2
        $pkgname-$pkgver.diff)
md5sums=('8a587ce59818bb83ceedc8629d494ee9'
         '70b53f56709e6b0c7ea38cbbfbc87e99')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff || return 1
  make build || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install 2> /dev/null
  sed -i "/^ADMIN/ s/=.*/=$pkgver/" "$startdir/$install"
}
