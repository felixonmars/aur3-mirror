# $Id$
# Maintainer: der_fenix <derfenix@gmail.com>

pkgname=qtwebkit-plugins-git
pkgver=6112013
pkgrel=1
pkgdesc="Set of QtWebKit platform plugins for the latest QtWebKit: spellcheck and notifications. Git version"
url="https://github.com/QupZilla/qtwebkit-plugins"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qtwebkit>=2.3' 'hunspell')
provides=('qtwebkit-plugins')
conflicts=('qtwebkit-plugins')
_gitroot='https://github.com/QupZilla/qtwebkit-plugins.git'
_gitname='qtwebkit-plugins'

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."
    cd "$srcdir/$_gitname"
    qmake-qt4
    make
}

package() {
   cd "${srcdir}/${_gitname}"
  
   make INSTALL_ROOT=$pkgdir install
}
