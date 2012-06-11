# Maintainer: David Runge <david[d]runge[a]frqrec[d]com>
pkgname=vim-repress
pkgver=2.1.5
pkgrel=2
pkgdesc="VIM plugin for managing wordpress blogs"
arch=('any')
url="https://bitbucket.org/pentie/vimrepress"
license=('GPL3')
depends=('vim-runtime' 'python2' 'python2-markdown')
install=${pkgname}.install
source=("https://bitbucket.org/pentie/vimrepress/downloads/vimpress-stable_${pkgver}_r81_13e8413bc8e7.zip")
md5sums=('77d2aa0cd0f45166125aa785a39efe1d')

build() {
	cd ${srcdir}/
	install -vd ${pkgdir}/usr/share/vim/vimfiles/{plugin,doc,syntax}
	install -vDm644 plugin/blog.vim ${pkgdir}/usr/share/vim/vimfiles/plugin
	install -vDm644 doc/vimpress.txt ${pkgdir}/usr/share/vim/vimfiles/doc
	install -vDm644 syntax/blogsyntax.vim ${pkgdir}/usr/share/vim/vimfiles/syntax
}
