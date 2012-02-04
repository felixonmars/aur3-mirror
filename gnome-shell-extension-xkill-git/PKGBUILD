# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=gnome-shell-extension-xkill-git
pkgver=20111227
pkgrel=1
pkgdesc="A gnome shell extension that adds a 'Force Quit' button to gnome panel"
arch=('any')
url="http://motorscript.com/gnome-shell-extension-force-quit/"
license=('GPL3')
depends=('gnome-shell' 'xorg-xkill')
makedepends=('git')

_gitroot="https://github.com/xtranophilist/gnome-shell-extension-force-quit.git"
_gitname="gnome-shell-extension-force-quit"

build() {
    cd ${srcdir}/
    msg "Connecting to the GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
	cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot} ${_gitname}
    fi
    msg "GIT checkout done."
}

package() {
    cd "$srcdir/${_gitname}"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/force-quit@xtranophilist"
    cp "$srcdir/${_gitname}/metadata.json" "$pkgdir/usr/share/gnome-shell/extensions/force-quit@xtranophilist"
    cp "$srcdir/${_gitname}/extension.js" "$pkgdir/usr/share/gnome-shell/extensions/force-quit@xtranophilist"
}
