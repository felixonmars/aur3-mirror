# Maintainer: Alucryd <alucryd at gmail dot com>

pkgname=gnome-shell-extension-classic-systray-git
pkgver=20120420
pkgrel=1
pkgdesc="A GNOME Shell extension to move the apps status icons to the top bar"
url="https://github.com/rcmorano/gnome-shell-gnome2-notifications"
license=('GPL2')
arch=('any')
depends=('gnome-shell')
makedepends=('git')

_gitroot="https://github.com/rcmorano/gnome-shell-gnome2-notifications.git"
_gitname="gnome-shell-gnome2-notifications"

build() {
  cd "$srcdir"
  msg "Connecting to the GIT server..."
  if [[ -d "$srcdir/$_gitname" ]] ; then
    cd "${_gitname}"
    git pull origin
    msg "The local files are updated..."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done."
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm644 gnome-shell-classic-systray@emergya.com/extension.js $pkgdir/usr/share/gnome-shell/extensions/gnome-shell-classic-systray@emergya.com/extension.js
    install -Dm644 gnome-shell-classic-systray@emergya.com/metadata.json $pkgdir/usr/share/gnome-shell/extensions/gnome-shell-classic-systray@emergya.com/metadata.json
}

