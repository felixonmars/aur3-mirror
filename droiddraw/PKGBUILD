# Maintainer: AlexanderR <alexander r at gmx com>
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Sebastian Chlan <sebastian.chlan@gmail.com>
pkgname=droiddraw
pkgver=r1b22
pkgrel=1
pkgdesc='Provides a visual interface editor for the operating system.'
arch=('any')
url='http://droiddraw.org'
license=('GPL2')
depends=('java-runtime')
source=("https://droiddraw.googlecode.com/files/droiddraw-${pkgver}.tgz")

build () {
  echo -e "#/bin/sh\njava -jar /usr/share/$pkgname/droiddraw.jar" > "${srcdir}/droiddraw-${pkgver}/droiddraw.sh"
}

package() {
  install -d ${pkgdir}/usr/{bin,share/$pkgname}
  install -D -m644 "${srcdir}/droiddraw-${pkgver}/droiddraw.jar" "${pkgdir}/usr/share/$pkgname/droiddraw.jar"
  install -D -m755 "${srcdir}/droiddraw-${pkgver}/droiddraw.sh" "${pkgdir}/usr/bin/droiddraw"
}
md5sums=('9fe062b03c30e8b164360896f9a2d747')
