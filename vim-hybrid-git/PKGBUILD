pkgname=vim-hybrid-git
pkgver=20130726
pkgrel=1
pkgdesc='A dark colourscheme combining Jellybeans, Solarized and Tomorrow-Night'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=4164'
license=('unknown')
makedepends=('git')
depends=('vim-runtime>=7.3')
groups=('vim-plugins')
install=hybrid.install

_gitroot='https://github.com/w0ng/vim-hybrid.git'
_gitname='vim-hybrid'

build() {
    cd $srcdir

    msg 'Connecting to GIT server...'
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg 'The local files are updated.'
    else
        git clone $_gitroot $_gitname
    fi
    msg 'GIT checkout done or server timeout.'
}

package() {
    cd "$srcdir/$_gitname"

    install -d $pkgdir/usr/share/vim/vimfiles/colors
    install -Dm644 colors/hybrid.vim       $pkgdir/usr/share/vim/vimfiles/colors/
    install -Dm644 colors/hybrid-light.vim $pkgdir/usr/share/vim/vimfiles/colors/
}
