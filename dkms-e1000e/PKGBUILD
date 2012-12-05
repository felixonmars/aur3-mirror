# Contributor: Gero Müller <post@geromueller.de>
pkgname=dkms-e1000e
_modname=e1000e
pkgver=2.1.4
pkgrel=1
pkgdesc="Intel e1000e server adapters driver"
license=(GPL)
arch=(i686 x86_64)
makedepends=(linux-headers)
depends=('dkms')
install=dkms-e1000e.install
url='http://downloadcenter.intel.com/detail_desc.aspx?agr=Y&DwnldID=13663'
source=(http://downloadmirror.intel.com/15817/eng/$_modname-$pkgver.tar.gz dkms.conf.in dkms-e1000e.install)
md5sums=('e8dba81bfc86c6c75f39d025fb70899f'
         '7832e2d2026d44a517f042c7b02945fa'
         '4c5f930067885515209e0ad8d8c57a89')

build() {
  cd ${srcdir}/${_modname}-${pkgver}
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  for i in "${srcdir}/${_modname}-${pkgver}/src/"{Makefile,*.c,*.h}; do
    install -D -m644 "${i}" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  done
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
