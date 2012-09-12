# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-gse-plugin
pkgver=0.9.0
pkgrel=1
pkgdesc="The GSE plugin for OpenSAND"
arch=('i686')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand-plugins')
depends=('opensand-core' 'opensand-conf' 'opensand-manager' 'libgse')
install='opensand-gse-plugin.install'
source=("https://launchpad.net/opensand/0.9.x/0.9.0/+download/opensand-${pkgver}.tar.gz"
        "http://bazaar.launchpad.net/~opensand-maintainers/opensand/0.9.x/download/head:/gse.py-20120615082550-epo2sgeicd4kvjso-1821/gse.py")
md5sums=('16ccb9ce24259f7ca943f05b5b322bc1'
         'a247f47b6ca0f61d22bb0c0c53a55b82')

build() {
  cd "$srcdir/opensand-$pkgver"
  tar xf ${pkgname}-${pkgver}.tar.gz
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
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
  install -Dm644 "${srcdir}/gse.py" \
                 "${pkgdir}/usr/lib/python2.7/site-packages/opensand_manager_core/modules/gse.py"

  # Plugin configuration
  install -Dm644 conf/gse.conf "${pkgdir}/usr/share/opensand/plugins/gse.conf"
  install -Dm644 conf/gse.xsd "${pkgdir}/usr/share/opensand/plugins/gse.xsd"
}

# vim:set ts=2 sw=2 et:
