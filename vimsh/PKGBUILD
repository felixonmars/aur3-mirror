# Contributor: Laszlo Papp <djszapi @ gmail at com>
# Maintainer: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=vimsh
pkgver=0.20
pkgrel=2
pkgdesc="Terminal/shell buffer script for python enabled [g]vim"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=165"
license=('custom')
depends=('vim')
source=('license.txt' 'vimsh.py' 'vimsh.readme' 'vimsh.vim' )
md5sums=('efbd5986e691ce8c876fb86e8f5961ea'\
         '15e5205a74161a497f375ed574edb231'\
         'a599d62689c55e67a3226278c78162db'\
         '4a33b8122f0f268a4c09de2f4088434d')

build() {
	cd $srcdir/
	install -d $pkgdir/usr/share/{licenses/$pkgname,pkgname,vim/plugin}
	install vimsh.* $pkgdir/usr/share/$pkgname/
	install $pkgdir/usr/share/$pkgname/vimsh.vim $pkgdir/usr/share/vim/plugin/
	install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/

}

