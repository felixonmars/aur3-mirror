#Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-extension-extended-volume-indicator-git
pkgver=20120303
pkgrel=1
pkgdesc="Switch output devices and adjust application volume on volume indicator menu"
arch=('any')
url="https://github.com/tigersoldier/Output-device-chooser-on-volume-menu"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')

_gitroot="git://github.com/tigersoldier/Output-device-chooser-on-volume-menu.git"
_gitname="Output-device-chooser-on-volume-menu"

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
    install -Dm 644 "${srcdir}/Output-device-chooser-on-volume-menu/extension.js" "${pkgdir}/usr/share/gnome-shell/extensions/multi-volume@tigersoldier/extension.js"
    install -Dm 644 "${srcdir}/Output-device-chooser-on-volume-menu/metadata.json" "${pkgdir}/usr/share/gnome-shell/extensions/multi-volume@tigersoldier/metadata.json"
}
