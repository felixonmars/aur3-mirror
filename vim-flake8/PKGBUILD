# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
pkgname=vim-flake8
pkgver=1.3
pkgrel=1
pkgdesc="A flake8 based Python source file checker for Vim"
arch=('any')
url="https://github.com/nvie/vim-flake8"
license=('unknown')
depends=('vim' 'flake8')
groups=('vim-plugins')
source=('https://github.com/nvie/vim-flake8/archive/1.3.zip')
md5sums=('5970de5e3debfd68493972876c026f06')

package() {
	cd ${srcdir}
	local _installpath="${pkgdir}/usr/share/vim/vimfiles"
	install -D -m644 vim-flake8-1.3/ftplugin/python_flake8.vim \
		${_installpath}/python_flake8.vim || return 1
}
