# Contributor: Nazarov Pavel <nazarov.pn@gmail.com>

pkgname=gnome-shell-extension-hide-dash-git
pkgver=20120120
pkgrel=1
pkgdesc="gnome-shell-extension-hide-dash is a simple extension that hides the dash from the activities overview"
arch=('i686' 'x86_64')
url="https://github.com/zacbarton/gnome-shell-extension-hide-dash"
groups=('gnome-shell-extensions')
license=('')
depends=('gnome-shell')

_gitroot="git://github.com/zacbarton/gnome-shell-extension-hide-dash.git"
_gitname="gnome-shell-extension-hide-dash"

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
  install -Dm644 hide-dash@zacbarton.com/extension.js $pkgdir/usr/share/gnome-shell/extensions/hide-dash@zacbarton.com/extension.js
  install -Dm644 hide-dash@zacbarton.com/metadata.json $pkgdir/usr/share/gnome-shell/extensions/hide-dash@zacbarton.com/metadata.json
}
