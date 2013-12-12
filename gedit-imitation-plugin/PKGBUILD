# Maintainer : Martin Wimpress <code@flexion.org>

pkgname=gedit-imitation-plugin
_pluginname=imitation
pkgver=1.3
pkgrel=2
pkgdesc="Edit a document in multiple places for Gedit 3"
arch=('any')
url="http://codetree.com.au/projects/imitation/"
license=('GPL3')
depends=('gedit>=3.8.0')
changelog=ChangeLog
install=imitation.install
source=(http://codetree.com.au/static/content/imitation/releases/imitation-${pkgver}.tar.gz)
md5sums=('ff298ff169fba540411767aa62990fa0')

package() {
    #mkdir -p "${pkgdir}/usr/lib/gedit/plugins/"
    install -d -m 755 "${pkgdir}/usr/lib/gedit/plugins/${_pluginname}"
    cp -r "${srcdir}/${_pluginname}/"* "${pkgdir}/usr/lib/gedit/plugins/${_pluginname}/"
    install -m 644 "${srcdir}/${_pluginname}.plugin" "${pkgdir}/usr/lib/gedit/plugins/"    
    install -d -m 755 "${pkgdir}/usr/share/glib-2.0/schemas"
    install -m 644 "${srcdir}/org.gnome.gedit.plugins.imitation.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas"
}
