# Maintainer: Adria Arrufat < swiftscythe at gmail >

pkgname=vim-jedi-git
pkgver=20130106
pkgrel=1
pkgdesc='Awesome Python autocompletion with VIM'
arch=('any')
license=('LGPL3')
url='https://github.com/davidhalter/jedi-vim'
install='vimdoc.install'
depends=('vim' 'python2-jedi-git')
makedepends=('git')
_gitroot=git://github.com/davidhalter/jedi-vim.git
_gitname=jedi-vim

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

  rm ${pkgdir}/usr/share/vim/vimfiles/{CONTRIBUTING.md,README.rst,AUTHORS.txt,LICENSE.txt}

}

# vim:set ts=2 sw=2 et:

