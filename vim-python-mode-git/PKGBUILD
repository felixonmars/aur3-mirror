# Maintainer: Adria Arrufat < swiftscythe at gmail >

pkgname=vim-python-mode-git
pkgver=20121217
pkgrel=1
pkgdesc='Python-mode is a vim plugin that allows you to use the pylint, rope, pydoc library in vim to provide features like python code looking for bugs, refactoring and some other useful things.'
arch=('any')
license=('LGPL3')
url='https://github.com/klen/python-mode'
install='vimdoc.install'
depends=('vim' 'python2')
makedepends=('git')
_gitroot=git://github.com/klen/python-mode.git
_gitname=vim-python-mode

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	
	msg "GIT checkout done or server timeout"
}


package() {

  cd ${srcdir}/${_gitname}

  install -d ${pkgdir}/usr/share/vim/vimfiles/

  cp -R * ${pkgdir}/usr/share/vim/vimfiles/

  rm ${pkgdir}/usr/share/vim/vimfiles/{Makefile,README.rst}

}

# vim:set ts=2 sw=2 et:

