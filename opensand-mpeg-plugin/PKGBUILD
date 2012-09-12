# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-mpeg-plugin
pkgver=0.9.0
pkgrel=1
pkgdesc="The MPEG2-TS plugin for OpenSAND"
arch=('i686')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand-plugins')
depends=('opensand-core' 'opensand-conf' 'opensand-manager')
install='opensand-mpeg-plugin.install'
source=("https://launchpad.net/opensand/0.9.x/0.9.0/+download/opensand-${pkgver}.tar.gz"
        "http://bazaar.launchpad.net/~opensand-maintainers/opensand/0.9.x/download/head:/mpeg.py-20120615082550-epo2sgeicd4kvjso-1875/mpeg.py")
md5sums=('16ccb9ce24259f7ca943f05b5b322bc1'
         '4f23e1083e5f1bee7e4ef1026e3a1e54')

build() {
  cd "$srcdir/opensand-$pkgver"
  tar xf ${pkgname}-${pkgver}.tar.gz
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  find "${srcdir}" -name '*.py' -print -exec sed -i -r "s|#!/usr/bin/env python $|#!/usr/bin/env python2|" {} \; 
  make
}

check() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Package manager configuration
  install -Dm644 "${srcdir}/mpeg.py" \
                 "${pkgdir}/usr/lib/python2.7/site-packages/opensand_manager_core/modules/mpeg.py"

  # Plugin configuration
  mkdir -p "${pkgdir}/usr/share/opensand/plugins/"
  install -Dm644 conf/mpeg.conf "${pkgdir}/usr/share/opensand/plugins/mpeg.conf"
  install -Dm644 conf/mpeg.xsd "${pkgdir}/usr/share/opensand/plugins/mpeg.xsd"
}

# vim:set ts=2 sw=2 et:
