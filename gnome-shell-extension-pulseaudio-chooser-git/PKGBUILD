# Contributor: Florian Bäuerle <florian.bae@gmail.com>

pkgname=gnome-shell-extension-pulseaudio-chooser-git
pkgver=20120126
pkgrel=1
pkgdesc="If there are more than one sound cards, you can choose the default output device without launching Sound Settings"
arch=('i686' 'x86_64')
url="https://github.com/tigersoldier/Output-device-chooser-on-volume-menu"
groups=('gnome-shell-extensions')
license=('unknown')
depends=('gnome-shell')

_gitroot="https://github.com/tigersoldier/Output-device-chooser-on-volume-menu.git"
_gitname="Output-device-chooser-on-volume-menu"

build() {
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
}

package() {
    cd $srcdir/$_gitname
    install -Dm644 extension.js $pkgdir/usr/share/gnome-shell/extensions/multi-volume@tigersoldier/extension.js
    install -Dm644 metadata.json $pkgdir/usr/share/gnome-shell/extensions/multi-volume@tigersoldier/metadata.json
}

