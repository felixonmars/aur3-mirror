# Maintainer Oemer Yildiz <hallo@systemfreund.com>

pkgname=rest-shell
pkgver=1.2.1.RELEASE
pkgrel=1
pkgdesc="Spring HATEOAS-compliant REST shell"
arch=("any")
url="https://github.com/spring-projects/rest-shell"
license=('Apache')
depends=('java-runtime-common')
source=('https://cloud.github.com/downloads/spring-projects/rest-shell/rest-shell-1.2.1.RELEASE.tar.gz'
  'rest-shell')
md5sums=('151da1e7c85a71715cc644bd728181ce'
 'f14db991303da8f3aaed37f0f28746d9')

package() {
  APP_HOME=${pkgdir}/usr/share/java/${pkgname}
  mkdir -p $APP_HOME
  mkdir -p ${pkgdir}/usr/bin
  cp -r ${srcdir}/${pkgname}-${pkgver}/lib $APP_HOME
  cp ${srcdir}/rest-shell ${pkgdir}/usr/bin
}

install() {
  mkdir /usr/share/java/${pkgname}
#  cp -r lib /usr/share/java/${pkgname}
}
