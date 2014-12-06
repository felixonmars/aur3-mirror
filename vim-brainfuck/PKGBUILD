# Maintainer: Beerstorm <beerstorm.emberbeard@gmail.com>
pkgname=vim-brainfuck
pkgver=1.0
pkgrel=1
pkgdesc="Vim syntax file for Brainfuck"
arch=('any')
url="https://github.com/Beerstorm/vim-brainfuck.git"
license='unknown'
depends=('vim')
makedepends=('git')
source=('git+https://github.com/Beerstorm/vim-brainfuck.git')
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/vim/vimfiles"
	cp -r $srcdir/$pkgname/{ftdetect,syntax} $pkgdir/usr/share/vim/vimfiles
}
