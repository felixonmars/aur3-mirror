# Maintainer: Scott Garrett <mail@exovenom.net>

pkgname=gnome-shell-extension-searchrecentlyused-git
pkgver=10
pkgrel=1
pkgdesc="GNOME Shell extension to search recently used files from the overview."
arch=('any')
url="https://github.com/bmh1980/gnome-shell-extension-searchrecentlyused"
depends=('gnome-shell')
license=('GPL')
replaces=('gnome-shell-extension-searchrecentlyused')

_gitroot='https://github.com/bmh1980/gnome-shell-extension-searchrecentlyused.git'
_gitname='gnome-shell-extension-searchrecentlyused'

build() {
    cd "$srcdir"

    msg 'Connecting to GIT server...'
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg 'The local files are updated.'
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg 'GIT checkout done or server timeout.'

    cd "${srcdir}/${_gitname}"
    make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir" install
}
