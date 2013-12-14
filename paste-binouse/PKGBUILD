# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=paste-binouse
pkgver=1.11
pkgrel=1
pkgdesc="paste-binouse is a standalone C++ web pastebin"
arch=('i686' 'x86_64')
url="http://github.com/abique/paste-binouse"
license=('MIT')
makedepends=('cmake>=2.8')
depends=('gnutls')
options=()
source=("http://88.191.147.34:4242/${pkgname}/${pkgname}-${pkgver}.tar.xz"
  "paste-binoused.confd"
  "paste-binouse.install"
  "paste-binoused.service")
md5sums=('e2051c382d535a81a5d641e0796becc4'
         '53b10719525f897b8e82adcc6c260dec'
         '16c1e7de70723d7ffd2de803d1bffaf3'
         '232e99c5a358c05e45e87bfb496d29e1')
backup=('etc/conf.d/paste-binoused')
install='paste-binouse.install'

build() {
  cd ${srcdir}/${pkgname}-${pkgver} &&
  rm -rf build &&
  mkdir build &&
  cd build &&
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. &&
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build &&
  DESTDIR=${pkgdir} make install
  install -Dm644 "${srcdir}"/paste-binoused.confd "${pkgdir}"/etc/conf.d/paste-binoused
  install -Dm644 "${srcdir}"/paste-binoused.service "${pkgdir}"/usr/lib/systemd/system/paste-binoused.service
}
