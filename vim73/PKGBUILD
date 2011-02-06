# Maintainer: Dmitry Frank <dimon.frank@gmail.com>

pkgname=vim73
pkgver=7.3
pkgrel=1
pkgdesc="Vim Text Editor"
arch=('any')
license=('unknown')
url="http://www.vim.org"
#install=vim73.install
source=(ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2)
conflicts=('gvim' 'vim')
md5sums=('5b9510a17074e2b37d8bb38ae09edbf2')

build() {
	cd $startdir/src/$pkgname

	mkdir -p $startdir/pkg

   ./configure --prefix=/usr

	make

	make DESTDIR="$startdir/pkg" install
}
