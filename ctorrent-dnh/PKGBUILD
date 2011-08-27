# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=ctorrent-dnh
pkgver=3.3.2
pkgrel=3
pkgdesc="A high-performance BitTorrent client with minimal system resources"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/dtorrent/"
license=('GPL')
depends=('openssl')
conflicts=('ctorrent')
source=(http://downloads.sourceforge.net/dtorrent/${pkgname}${pkgver}.tar.gz)
md5sums=('59b23dd05ff70791cd6449effa7fc3b6')

build() {
  cd ${pkgname}${pkgver}

  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
}
