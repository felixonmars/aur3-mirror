# Maintainer: barko (info@preprosto.com)

pkgname=createlauncher
pkgver=2014.05.14.x86_64
pkgrel=1.2
pkgdesc="Create an Application Launcher."
arch=(x86_64)
url='https://github.com/trinajstica/createlauncher'
license=(GPL3)
depends=(gtk2)
provides=(${pkgname})
source=(http://preprosto.com/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=(776726b2ae90ee436101e6e9fc212e3b)

package() {
  cd ${srcdir}
  install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m 644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}

