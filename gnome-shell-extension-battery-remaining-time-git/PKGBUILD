#Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-extension-battery-remaining-time-git
pkgver=20120516
pkgrel=2
pkgdesc="Gnome Shell extension to show remaining time for battery near the icon on the top panel."
arch=('any')
url="https://extensions.gnome.org/extension/230/battery-remaining-time/"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')
install=battery-remaining-time.install
groups=('gnome-shell-extensions')

_gitroot="git://github.com/dadexix86/battery-remaining-time.git"
_gitname="battery-remaining-time"

build() {
  cd "$srcdir"
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
  _uuid="battery-remaining-time@dadexix86.github.com"
  cd ${srcdir}/${_gitname}

  install -Dm 644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m 644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m 644 "prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefs.js"
  install -m 644 "convenience.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/convenience.js"

  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "schemas/org.gnome.shell.extensions.${_gitname}.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.${_gitname}.gschema.xml"
}
