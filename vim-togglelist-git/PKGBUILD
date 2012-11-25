# Contributer: Jo De Boeck <grimpy.reaper@gmail.com>

pkgname="vim-togglelist-git"
pkgver=1
pkgrel=1
pkgdesc="A simple plugin for vim that allows you to bind a key to toggle the Location List and the Quickfix List."
url="https://github.com/milkypostman/vim-togglelist"
license=("AS is")
arch=("i686" "x86_64")
depends=("git" 'vim')
makedepends=("git")
provides=("vim-togglelist")
source=()
md5sums=()

_gitroot="git://github.com/milkypostman"
_gitrepo="vim-togglelist"

build() {
	cd ${srcdir}

	# update the repo, else clone a new one
	if [ -d ${_gitrepo} ]; then
		cd ${_gitrepo}
		git pull
	else
		git clone ${_gitroot}/${_gitrepo}
		cd ${_hgrepo}
	fi
 
    mkdir -p $pkgdir/usr/share/vim/vimfiles/doc/
    cp -r ${srcdir}/vim-togglelist/* $pkgdir/usr/share/vim/vimfiles/
    rm -rf $pkgdir/usr/share/vim/vimfiles/.git
    mv $pkgdir/usr/share/vim/vimfiles/README.md $pkgdir/usr/share/vim/vimfiles/doc/vim-togglelist.md

}
