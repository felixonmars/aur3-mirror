#Contributor: Rafael Garcia <rafael.garcia.gallego@gmail.com>

pkgname=sandy-hg
pkgver=70
pkgrel=1
pkgdesc="Simple ncurses text editor, latest hg pull"
url="http://tools.suckless.org/sandy/"
arch=('i686' 'x86_64')
license=('MIT')
conflicts=('sandy')
provides=('sandy')
depends=('ncurses')
makedepends=('mercurial' 'sed' 'pkgconfig')
optdepends=('dmenu: X11 integration' 'xsel: X11 integration')
source=()
md5sums=()

_hgroot='http://hg.suckless.org/'
_hgrepo='sandy'

build() {
        cd $startdir/src

        # update the repo, else clone a new one
        if [ -d $_hgrepo ]; then
                cd $_hgrepo
                make clean
                hg pull -u
        else
                hg clone ${_hgroot}/${_hgrepo}
                cd $_hgrepo
        fi

        make PREFIX=/usr DESTDIR=$pkgdir clean install || return 1

        mkdir -p $startdir/pkg/usr/share/licenses/sandy
        cp LICENSE $startdir/pkg/usr/share/licenses/sandy
}

