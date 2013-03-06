# Maintainer:  Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Elder Marco <eldermarco at gmail dot com>

pkgname=gnome-shell-extension-noa11y
_pkgname=noa11y
pkgver=3.6.0
pkgrel=1
pkgdesc="A gnome-shell extension to remove the accessibility icon from the panel"

license=('GPL2')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
source=("http://www.fpmurphy.com/gnome-shell-extensions/${_pkgname}-${pkgver}.tar.gz")

depends=('gnome-shell>=3.6.0')

arch=('any')
md5sums=('39d15d53ab20a0715c69afe5b8de2b48')

package () {
    _uuid="${_pkgname}@fpmurphy.com"
    cd "$srcdir/$_uuid"

    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install -p -m0644 extension.js metadata.json \
        "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}