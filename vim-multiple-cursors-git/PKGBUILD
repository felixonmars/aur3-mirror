# Maintainer: Adria Arrufat < swiftscythe at gmail >

pkgname=vim-multiple-cursors-git
pkgver=20130105
pkgrel=1
pkgdesc='True Sublime Text style multiple selections for Vim'
arch=('any')
license=('MIT')
url='https://github.com/terryma/vim-multiple-cursors'
install='vimdoc.install'
depends=('vim')
makedepends=('git')
_gitroot=git://github.com/terryma/vim-multiple-cursors.git
_gitname=vim-multiple-cursors

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

  rm -rf ${pkgdir}/usr/share/vim/vimfiles/{README.md,MIT-LICENSE.txt,assets}

}

# vim:set ts=2 sw=2 et:

