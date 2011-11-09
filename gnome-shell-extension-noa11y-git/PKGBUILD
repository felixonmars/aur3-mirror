# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=gnome-shell-extension-noa11y-git
pkgver=20111109
pkgrel=1
pkgdesc="A GNOME Shell extension to remove the Accessibility icon from the panel"
url="https://github.com/fmoralesc/noa11y-colemando.com"
license=('GPL2')
arch=('any')
depends=('gnome-shell')
makedepends=('git')

_gitroot="https://github.com/fmoralesc/noa11y-colemando.com.git"
_gitname="noa11y-colemando.com"

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
    install -Dm644 extension.js $pkgdir/usr/share/gnome-shell/extensions/noa11y@colemando.com/extension.js
    install -Dm644 metadata.json $pkgdir/usr/share/gnome-shell/extensions/noa11y@colemando.com/metadata.json
    install -Dm644 README $pkgdir/usr/share/gnome-shell/extensions/noa11y@colemando.com/README
}

