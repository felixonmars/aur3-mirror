#Maintainer: jsh <jsh at myreseau dot org>

pkgname=gnome-shell-extension-multiple-monitor-panels-git
pkgver=20121101
pkgrel=1
pkgdesc="Add top panels including a monitor specific appMenu, on all extra monitors."
arch=('any')
url="https://github.com/darkxst/multiple-monitor-panels"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')
install=multiple-monitor-panels.install

_gitroot="git://github.com/darkxst/multiple-monitor-panels.git"
_gitname="multiple-monitor-panels"

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
}

package() {
    uuid="extra-panels@darkxst.feathertop.org"
    cd "${srcdir}/${_gitname}"

    install -Dm644 "${uuid}/metadata.json" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/metadata.json"
    install -m644 "${uuid}/extension.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/extension.js"
    install -m644 "${uuid}/convenience.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/convenience.js"
    install -m644 "${uuid}/prefs.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/prefs.js"
    install -m644 "${uuid}/thumbnails.js" \
      "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}/thumbnails.js"

    install -Dm644 "COPYING" \
      "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

    install -Dm644 "${uuid}/schemas/org.gnome.shell.extensions.extra-panels.gschema.xml" \
        "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.extra-panels.gschema.xml"
}

