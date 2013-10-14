#Maintainer: Alex Ferrando <alferpal@gmail.com>
_gitname=vim-node
pkgname=vim-node-git
pkgver=0.8.0_2_g37f6626
pkgrel=1
pkgdesc="Tools and environment to make Vim superb for developing with Node.js"
arch=('any')
url="https://github.com/moll/vim-node"
license=('GNU AGPL')
groups=('vim-plugins')
depends=('vim-runtime')
makedepends=('git' )
provides=('vim-node')
conflicts=('vim-node')
install=vimdoc.install
source=(git://github.com/moll/vim-node.git)
sha1sums=(SKIP)

pkgver() {
cd $_gitname
echo $(git describe --tags | sed 's#-#_#g;s#v##')
}

package() {
mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,autoload,ftdetect}

cd "$srcdir/$_gitname"
cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
cp -r autoload* $pkgdir/usr/share/vim/vimfiles/autoload
cp ftdetect/* $pkgdir/usr/share/vim/vimfiles/ftdetect

}

# vim:set ts=2 sw=2 et: 
