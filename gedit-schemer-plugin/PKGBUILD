# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=gedit-schemer-plugin
_pluginname=schemer
pkgver=0.3.0
pkgrel=1
pkgdesc="Color scheme editor for Gedit 3"
arch=('any')
url="https://github.com/jonocodes/GeditSchemer"
license=('GPL3')
depends=('gedit')
changelog=ChangeLog
source=(https://github.com/jonocodes/GeditSchemer/archive/v${pkgver}.zip)
md5sums=('5c1492eec71d9f51a6ef5020bc752d14')

package() {
    mkdir -p "${pkgdir}/usr/lib/gedit/plugins/"
    install -d -m 755 "${pkgdir}/usr/lib/gedit/plugins/${_pluginname}"
    cp -r "${srcdir}/GeditSchemer-${pkgver}/${_pluginname}/"* "${pkgdir}/usr/lib/gedit/plugins/${_pluginname}/"
    install -m 644 "${srcdir}/GeditSchemer-${pkgver}/${_pluginname}.plugin" "${pkgdir}/usr/lib/gedit/plugins/"
}
