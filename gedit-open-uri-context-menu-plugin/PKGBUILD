# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=gedit-open-uri-context-menu-plugin
_pluginname=open-uri-context-menu
pkgver=2.0
pkgrel=1
pkgdesc="Adds Open URI Content Menu to Gedit 3"
arch=('any')
url="http://www.jpfleury.net/en/software/open-uri-context-menu.php"
license=('GPL3')
depends=('gedit' 'xdg-utils')
changelog=ChangeLog
source=("https://gitorious.org/projets-divers/${_pluginname}/archive/master.zip")
md5sums=('SKIP')

package() {
    cd "${srcdir}"
    unzip -o "${srcdir}/master.zip"
    install -d -m 755 "${pkgdir}/usr/lib/gedit/plugins/"
    install -m 644 "${srcdir}/projets-divers-${_pluginname}/${_pluginname}.plugin" "${pkgdir}/usr/lib/gedit/plugins/"
    install -m 755 "${srcdir}/projets-divers-${_pluginname}/${_pluginname}.py" "${pkgdir}/usr/lib/gedit/plugins/"
}
