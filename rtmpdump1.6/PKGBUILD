# Contributor: Jonas Haag <jonas@lophus.org>

pkgname=rtmpdump1.6
pkgver=gcc1
pkgrel=1
pkgdesc="rtmpdump1.6, useful for dumping old-format rtmp streams."
arch=('i686' 'x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('LGPL')
depends=('openssl' 'zlib')
source=("http://jonas.lophus.org/rtmpdump1.6-gcc.tar.gz")
md5sums=('ae6c1ea5e19ba3339bd8a978a4251942')

build() {
  cd ${srcdir}/${pkgname}
  make || return 1
  install -Dm755 ${srcdir}/${pkgname}/rtmpdump_* "${pkgdir}/usr/bin/rtmpdump1.6" || return 1
}
