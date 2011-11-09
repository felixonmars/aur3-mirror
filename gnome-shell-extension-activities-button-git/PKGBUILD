# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=gnome-shell-extension-activities-button-git
pkgver=20111109
pkgrel=1
pkgdesc="A GNOME Shell extension to customize the activities button"
url="https://github.com/fpmurphy/GNOME-3.2-Shell-extensions"
license=('GPL2')
arch=('any')
source=('activitiesbutton.png')
md5sums=('316ce60781155b2910d5c3b301a24d5f')
depends=('gnome-shell')
makedepends=('git')

_gitroot="https://github.com/fpmurphy/GNOME-3.2-Shell-extensions.git"
_gitname="GNOME-3.2-Shell-extensions"

build() {
  cd $srcdir
  msg "Connecting to the GIT server..."
  if [[ -d $srcdir/$_gitname ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done."
}

package() {
    cd $srcdir/$_gitname
    install -Dm644 activitiesbutton@fpmurphy.com/extension.js $pkgdir/usr/share/gnome-shell/extensions/activitiesbutton@fpmurphy.com/extension.js
    install -Dm644 activitiesbutton@fpmurphy.com/metadata.json $pkgdir/usr/share/gnome-shell/extensions/activitiesbutton@fpmurphy.com/metadata.json
    install -Dm644 activitiesbutton@fpmurphy.com/activitiesbutton.css $pkgdir/usr/share/gnome-shell/extensions/activitiesbutton@fpmurphy.com/activitiesbutton.css
    install -Dm644 ../activitiesbutton.png $pkgdir/usr/share/gnome-shell/extensions/activitiesbutton@fpmurphy.com/activitiesbutton.png
    install -Dm644 activitiesbutton@fpmurphy.com/README $pkgdir/usr/share/gnome-shell/extensions/activitiesbutton@fpmurphy.com/README
}

