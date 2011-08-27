# Maintainer: Wido <widomaker2k7@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Bj?indeijer <bjorn@lindeijer.nl>
pkgname=enet-old
_pkgname=enet
pkgver=1.2.5
pkgrel=1
pkgdesc='A relatively thin, simple and robust network communication layer on top of UDP. (Old Version)'
arch=('i686' 'x86_64')
provides=('enet')
conflicts=('enet')
url='http://enet.bespin.org/'
license=('custom')
source=("http://enet.bespin.org/download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('fbf2fb70c115948405d48ded9fb5372c')

build() {
  cd ${_pkgname}-${pkgver}
  CFLAGS="-fPIC" ./configure --prefix=/usr
  make
  gcc -Wl,-soname,libenet.so.2 -shared -o libenet.so.2 *.o
}

package() {
  cd ${_pkgname}-${pkgver}
  make prefix=${pkgdir}/usr install
  install -m 755 libenet.so.2 ${pkgdir}/usr/lib
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
