# Contributer: Jo De Boeck <grimpy.reaper@gmail.com>

pkgname="vim-koe-git"
pkgver=1
pkgrel=1
pkgdesc="Vim plugin to generate docstring and so on"
url="https://github.com/RealNitro/koevim"
license=("AS is")
arch=("i686" "x86_64")
depends=("git" 'vim')
makedepends=("git")
provides=("vim-koe")
source=()
md5sums=()

_gitroot="git://github.com/RealNitro"
_gitrepo="koevim"

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
 
    mkdir -p $pkgdir/usr/share/vim/vimfiles/
    cp -r ${srcdir}/koevim/* $pkgdir/usr/share/vim/vimfiles/
    rm -rf $pkgdir/usr/share/vim/vimfiles/.git
    mkdir -p $pkgdir/usr/share/doc/vim-koe
    mv $pkgdir/usr/share/vim/vimfiles/README.rst $pkgdir/usr/share/doc/vim-koe

}
