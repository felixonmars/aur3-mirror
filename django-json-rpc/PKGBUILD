# Maintainer: Raphael Kubo da Costa <kubito@gmail.com>

pkgname=django-json-rpc
pkgver=0.6.1
pkgrel=4
pkgdesc="A basic JSON-RPC Implementation for Django-powered sites."
arch=(i686 x86_64)
url="http://github.com/samuraisam/django-json-rpc"
license=('MIT')
depends=('django')
source=(https://github.com/downloads/samuraisam/django-json-rpc/django-json-rpc-0.6.1.tar.gz)
md5sums=('f2776b9e62ed52b254d99066ad314dc4')
sha256sums=('a3475abc26eff724103312407ddc30784b4741e583396a8e17aefba484cb6577')

build() {
  cd "${startdir}/src/${pkgname}-${pkgver}"
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root="${pkgdir}" || return 1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" || return 1
}
