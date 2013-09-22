# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=vlevel
pkgver=0.5
pkgrel=2
pkgdesc="A tool to amplify the soft parts of music"
arch=(i686)
url="http://vlevel.sourceforge.net/about/"
license=('GPL')
depends=('gcc')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8602cf64822e03e7eec1fc43d2d69eda')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make || return 1
}

package(){
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/vlevel-bin ${pkgdir}/usr/bin/vlevel-bin || return 1
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/vlevel-ladspa.so ${pkgdir}/usr/lib/ladspa/vlevel-ladspa.so || return 1
  mkdir -p ${pkgdir}/usr/share/vlevel
  cp -r ${srcdir}/${pkgname}-${pkgver}/{README,docs,utils} ${pkgdir}/usr/share/vlevel
}
