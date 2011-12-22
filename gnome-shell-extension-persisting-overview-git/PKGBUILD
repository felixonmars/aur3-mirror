# Maintainer: NiteHogg <keith.b.elliott [at] gmail [dot] com>
pkgname=gnome-shell-extension-persisting-overview-git
pkgver=20111221
pkgrel=1
pkgdesc="The overview will remain active after clicking an app launcher. Nice if you habitually launch a string of apps by hand. The extension also launches each app in a new window. This was decided because with the overview persisting, the active instance of an app doesn't exactly get the focus."
arch=(any)
url="https://github.com/nitehogg/gnome-shell-extension-persisting-overview"
_gitname="gnome-shell-extension-persisting-overview"
_github="git@github.com:nitehogg/$_gitname.git"
license=('GPL')
depends=(gnome-shell gnome-shell-extensions-common gnome-tweak-tool)
makedepends=(git)
install=extension.install
changelog=ChangeLog

build() {
    cd "$srcdir"
 
    if [ -d "$_gitname" ]
    then
        cd "$_gitname" && git pull "$_github"
        echo "Merged github repo."
    else
        git clone "$_github"
        echo "Cloned github repo."
    fi    
    
    echo
}

package() {
    uuid="$(grep "uuid.*," $srcdir/$_gitname/metadata.json | sed -r 's/[", ]//g;s/uuid:(.*)$/\1/g')"
    extension_dir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

    mkdir -p "$extension_dir"
    cp "$srcdir/$_gitname/"* "$extension_dir"
}

# vim:set ts=2 sw=2 et:
