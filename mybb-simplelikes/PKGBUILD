# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=mybb-simplelikes
_pkgname=SimpleLikes
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple post liking system for personal use. Integrated with MyAlerts"
install=mybb-simplelikes.install
arch=('any')
url=('https://github.com/euantorano/SimpleLikes/')
license=('GPL')
depends=('mybb' 'mybb-pluginlibrary')
source=("https://github.com/euantorano/SimpleLikes/archive/${pkgver}.tar.gz")
md5sums=('9383c9f078672570b98eb68da5b9172b')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/mybb/
  
  cp -ra ${srcdir}/${_pkgname}-${pkgver}/{converters,inc,jscripts} ${pkgdir}/usr/share/webapps/mybb/
}
