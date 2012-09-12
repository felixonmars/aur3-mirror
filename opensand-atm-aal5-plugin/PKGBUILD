# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-atm-aal5-plugin
pkgver=0.9.0
pkgrel=1
pkgdesc="The ATM/AAL5 plugin for OpenSAND"
arch=('i686')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand-plugins')
depends=('opensand-core' 'opensand-conf' 'opensand-manager')
install='opensand-atm-aal5-plugin.install'
source=("https://launchpad.net/opensand/0.9.x/0.9.0/+download/opensand-${pkgver}.tar.gz"
        "http://bazaar.launchpad.net/~opensand-maintainers/opensand/0.9.x/download/head:/atm_aal5.py-20120615082550-epo2sgeicd4kvjso-1776/atm_aal5.py")

md5sums=('16ccb9ce24259f7ca943f05b5b322bc1'
         '685832b46bc19d38f01febfeb89d2c6f')
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
  mkdir -p "${pkgdir}/usr/lib/python2.7/site-packages/opensand_manager_core/modules/"
  install -Dm644 "${srcdir}/atm_aal5.py" \
                 "${pkgdir}/usr/lib/python2.7/site-packages/opensand_manager_core/modules/atm_aal5.py"
}

# vim:set ts=2 sw=2 et:
