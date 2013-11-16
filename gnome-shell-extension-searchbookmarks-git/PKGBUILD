# Maintainer: Scott Garrett <mail@exovenom.net>

pkgname=gnome-shell-extension-searchbookmarks-git
pkgver=3
pkgrel=2
pkgdesc="GNOME Shell extension to search in bookmarks of different webbrowsers from the overview."
arch=('any')
url="https://github.com/bmh1980/gnome-shell-extension-searchbookmarks"
depends=('gnome-shell')
license=('GPL')
replaces=('gnome-shell-extension-searchbookmarks')

_gitroot='https://github.com/bmh1980/gnome-shell-extension-searchbookmarks.git'
_gitname='gnome-shell-extension-searchbookmarks'

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
