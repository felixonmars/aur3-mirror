# Maintainer: xhochy <uwelk@xhochy.org>

# need to choose anonther name since heimdal is still blacklisted
pkgname=jsdoc-toolkit
# Do not install the config as this will conflict with krb5
pkgver=2.4.0
pkgrel=2
pkgdesc="Documentation generator for JavaScript"
arch=('i686' 'x86_64')
url="http://code.google.com/p/jsdoc-toolkit/"
license=('custom')
depends=('rhino')
# Do not install the config as this will conflict with krb5
# backup=(etc/krb5/krb5.conf)
options=('!libtool' '!emptydirs')
source=(http://jsdoc-toolkit.googlecode.com/files/jsdoc_toolkit-${pkgver}.zip
  ignore-token.patch
  jsdoc
)
sha1sums=('bd276ec58dbd419326760226174eba09810d26ee' # jsdoc_toolkit-${pkgver}.zip
          'f3a31674c0fcdf1e2dfd95daf0abd4451e7d0a9a' # ignore-token.patch
          '285b5c353712c419f1b9b41691aac7160efaf37f' # jsdoc
)

build() {
  cd ${srcdir}/jsdoc_toolkit-${pkgver}/jsdoc-toolkit/
  patch -p2 < ../../ignore-token.patch
}

package() {
  install -Dm755 ${srcdir}/jsdoc_toolkit-${pkgver}/jsdoc-toolkit/jsrun.jar ${pkgdir}/usr/share/java/jsrun.jar
  install -Dm755 ${srcdir}/jsdoc ${pkgdir}/usr/bin/jsdoc
  mkdir -p ${pkgdir}/usr/share/jsdoc-toolkit
  cp -r ${srcdir}/jsdoc_toolkit-${pkgver}/jsdoc-toolkit/app ${pkgdir}/usr/share/jsdoc-toolkit/app
  cp -r ${srcdir}/jsdoc_toolkit-${pkgver}/jsdoc-toolkit/templates ${pkgdir}/usr/share/jsdoc-toolkit/templates
  chown -R root:root ${pkgdir}/usr/share/jsdoc-toolkit
}
