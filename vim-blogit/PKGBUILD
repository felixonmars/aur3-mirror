# Maintainer: David Runge <david[d]runge[a]frqrec[d]com>
pkgname=vim-blogit
pkgver=1.4.3
pkgrel=5
pkgdesc="VIM plugin to easily access wordpress"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2582"
license=('GPL3')
depends=('vim-runtime')
install=${pkgname}.install
source=("http://symlink.me/attachments/download/35/blogit-${pkgver}.tar.bz2" 'passwords.vim')
md5sums=('e818e4ce51391d5ec05896fa24cfa5d2'
         'ce6f53abec84a606eabc727e1b1cebed')

build() {
	cd ${srcdir}/
	install -vd ${pkgdir}/usr/share/vim/vimfiles/{plugin,doc}
	install -vd ${pkgdir}/etc/conf.d/vim
	install -vDm644 passwords.vim ${pkgdir}/etc/conf.d/vim
	install -vDm644 plugin/blogit.vim ${pkgdir}/usr/share/vim/vimfiles/plugin
	install -vDm644 doc/blogit.txt ${pkgdir}/usr/share/vim/vimfiles/doc
}
