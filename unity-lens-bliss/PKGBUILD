# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=unity-lens-bliss
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple Applications Lens for Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-lens-bliss"
license=('GPL3')
depends=('unity')
source=("http://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a0ab9536ee8864a53b6791c9704bf7faf2c2daed17abdf5b690cc120b7366ec9cc549caece49384df75aae1912820fb8b48ec51a1c7d94cac3badc45714c4f52')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #Python 2 fix
  sed -i 's|^\(#!.*python\)$|\12|g' bin/unity-bliss-daemon.in
  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/${pkgname}
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
