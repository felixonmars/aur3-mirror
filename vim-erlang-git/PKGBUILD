# Maintainer: Pawel 'kTT' Salata <rockplayer.pl@gmail.com>

pkgname=vim-erlang-git
pkgver=20100826
pkgrel=1
pkgdesc="A set of erlang plugins for VIM"
arch=(any)
url="http://github.com/oscarh/vimerl"
license=('GPL')
groups=('vim-plugins')
depends=('vim' 'erlang')
makedepends=('git')
source=()
md5sums=()

_gitroot="http://github.com/oscarh/vimerl.git"
_gitname="vimerl"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
    install -d ${pkgdir}/usr/share/vim/vimfiles
    cp -R --preserve=mode autoload ftplugin indent syntax $pkgdir/usr/share/vim/vimfiles
}
