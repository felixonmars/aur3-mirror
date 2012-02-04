# Maintainer: Krisoijn Chan <ksc at gmx dot us>

pkgname=vim-solarized-git
pkgver=20110901
pkgrel=1
pkgdesc="Precision colors for machines and people."
arch=('any')
url="http://ethanschoonover.com/solarized"
license=('MIT')
makedepends=('git')
depends=('vim')
conflicts=('vim-solarized')
provides=('vim-solarized')

_gitroot="https://github.com/altercation/vim-colors-solarized.git"
_gitname="vim-colors-solarized"

build() {
    # {{{ git
    cd $srcdir

    msg "Connecting to GIT server..."
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout."
    msg "Starting make..."
    rm -rf $srcdir/$_gitname-build
    git clone $srcdir/$_gitname $srcdir/$_gitname-build
    # }}}

    cd $srcdir/$_gitname-build

    install -dm755 $pkgdir/usr/share/vim/vim73/{plugin,bitmaps,colors,doc}

    install -Dm644 autoload/*           $pkgdir/usr/share/vim/vim73/plugin/
    install -Dm644 bitmaps/*            $pkgdir/usr/share/vim/vim73/bitmaps/
    install -Dm644 colors/*             $pkgdir/usr/share/vim/vim73/colors/
    install -Dm644 doc/solarized.txt    $pkgdir/usr/share/vim/vim73/doc/
}
