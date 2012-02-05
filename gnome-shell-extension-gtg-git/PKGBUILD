# Contributor: Florian Bäuerle <florian.bae@gmail.com>

pkgname=gnome-shell-extension-gtg-git
pkgver=20120205
pkgrel=1
pkgdesc="A gnome-shell extension that adds GTG (Getting Things Gnome) tasks in the date/calendar panel."
arch=('any')
url="https://github.com/invernizzi/Gnome-shell-GTG-extension"
groups=('gnome-shell-extensions')
license=('unknown')
depends=('gnome-shell')

_gitroot="https://github.com/invernizzi/Gnome-shell-GTG-extension.git"
_gitname="Gnome-shell-GTG-extension"

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
    install -Dm644 README $pkgdir/usr/share/gnome-shell/extensions/gtg@lucainvernizzi.net/README
    install -Dm644 extension.js $pkgdir/usr/share/gnome-shell/extensions/gtg@lucainvernizzi.net/extension.js
    install -Dm644 metadata.json $pkgdir/usr/share/gnome-shell/extensions/gtg@lucainvernizzi.net/metadata.json
    install -Dm644 stylesheet.css $pkgdir/usr/share/gnome-shell/extensions/gtg@lucainvernizzi.net/stylesheet.css
}

