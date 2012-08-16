# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=dvblast
pkgver=2.2
pkgrel=1
pkgdesc="A simple and powerful streaming application based on the linux-dvb API"
arch=('i686' 'x86_64')
url="http://www.videolan.org/projects/dvblast.html"
license=('GPL')
depends=('bitstream' 'bash')
source=(http://downloads.videolan.org/pub/videolan/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c7074e8902f1b200db93cc5287057c7f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=usr DESTDIR="$pkgdir/" install || return 1
}
