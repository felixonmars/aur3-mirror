# Maintainer: Laszlo Papp <djszapi2 at gmail dot com>
pkgname=lua-curl
pkgver=0.2
pkgrel=1
pkgdesc="Aiming for a full-fledged libcurl binding"
url="http://curl.haxx.se/libcurl/lua/"
license=('GPL')
depends=('lua' 'curl')
arch=('i686')
options=(!libtool)
source=("http://luaforge.net/frs/download.php/2634/$pkgname-$pkgver.tar.gz")
md5sums=('c15599e1147f76261f03a00088946d9d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
