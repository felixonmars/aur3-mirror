#Contributor: Rafael Garcia <rafael.garcia.gallego@gmail.com>

pkgname=slmenu-hg
pkgver=9
pkgrel=2
pkgdesc="Dmenu spinoff for the console"
url="https://bitbucket.org/rafaelgg/slmenu"
arch=('i686' 'x86_64' 'arm')
license=('MIT')
depends=("glibc")
makedepends=('mercurial')
optdepends=('xsel: X11 integration')
source=()
md5sums=()

_hgroot='https://bitbucket.org/rafaelgg'
_hgrepo='slmenu'

package() {
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

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

