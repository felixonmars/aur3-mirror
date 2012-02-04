# Contributor: Nazarov Pavel <nazarov.pn@gmail.com>

pkgname=gnome-shell-extension-calc-git
pkgver=20120120
pkgrel=1
pkgdesc="A simple calculator in the search overview"
arch=('i686' 'x86_64')
url="https://github.com/eonpatapon/gnome-shell-extension-calc"
groups=('gnome-shell-extensions')
license=('GPL2')
depends=('gnome-shell')

_gitroot="git://github.com/eonpatapon/gnome-shell-extension-calc.git"
_gitname="gnome-shell-extension-calc"

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
    install -Dm644 extension.js $pkgdir/usr/share/gnome-shell/extensions/calc@patapon.info/extension.js
    install -Dm644 metadata.json $pkgdir/usr/share/gnome-shell/extensions/calc@patapon.info/metadata.json
    install -Dm644 stylesheet.css $pkgdir/usr/share/gnome-shell/extensions/calc@patapon.info/activitiesbutton.css
    install -Dm644 COPYING $pkgdir/usr/share/gnome-shell/extensions/calc@patapon.info/COPYING
    install -Dm644 README.md $pkgdir/usr/share/gnome-shell/extensions/calc@patapon.info/README.md
}
