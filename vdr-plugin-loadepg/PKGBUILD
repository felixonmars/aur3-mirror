# Maintainer : Marco Franceschetti <vonfritz1 at gmail dot com>

_pluginname=loadepg
pkgname=vdr-plugin-$_pluginname
pkgver=0.2.6
pkgrel=1
arch=(i686 x86_64)
pkgdesc="VDR-Plugin display Canal+ group (Mediahighway) and Sky EPG Data"
url="http://lukkinosat.altervista.org/"
license="GPL"
makedepends=('vdr')
depends=('vdr')
backup=()
install="${pkgname}.install"
source=(http://lukkinosat.altervista.org/vdr-$_pluginname-$pkgver.tgz)
md5sums=('601c345941cd6d181ff6f5546fd02aee')


build() {
  cd "${srcdir}/${_pluginname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pluginname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p $pkgdir/var/lib/vdr/plugins/${_pluginname}/
  install -Dm644 ${srcdir}/$_pluginname-${pkgver}/conf/*    $pkgdir/var/lib/vdr/plugins/${_pluginname}
}
