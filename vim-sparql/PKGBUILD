# Maintainer: Beerstorm <beerstorm.emberbeard@gmail.com>
pkgname=vim-sparql
pkgver=1.0
pkgrel=1
pkgdesc="Vim syntax file for Sparql"
arch=('any')
url="https://github.com/Omer/vim-sparql"
license='unknown'
depends=('vim')
makedepends=('git')
source=('git+https://github.com/Omer/vim-sparql.git')
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/vim/vimfiles"
	cp -r $srcdir/$pkgname/{ftdetect,syntax} $pkgdir/usr/share/vim/vimfiles
}
