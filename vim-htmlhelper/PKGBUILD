# Contributor: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=vim-htmlhelper
pkgver=1.0
pkgrel=2
pkgdesc="Html macros and mappings"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2665"
license=('custom')
depends=('vim')
source=('license.txt' 'html.vim')
md5sums=('efbd5986e691ce8c876fb86e8f5961ea'\
         '5604b12ce687aa3e5c37c76cac794c4f')

build() {
	cd $srcdir/
     install -d $pkgdir/usr/share/{vim/ftplugin,licenses/$pkgname}
     install html.vim $pkgdir/usr/share/vim/ftplugin/
     install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/
}

