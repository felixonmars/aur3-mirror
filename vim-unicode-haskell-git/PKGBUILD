# Credits: Frerich Raabe <frerich.raabe_at_gmail.com>
# Maintainer : iosonofabio <iosonofabio_at_gmail.com>

pkgname=vim-unicode-haskell-git
pkgver=20120909
pkgrel=1
pkgdesc='Plugin adding unicode cuteness to vim-haskell. Git version.'
arch=(any)
url='https://github.com/frerich/unicode-haskell'
license=(custom)
depends=(vim)
makedepends=(git)
conflicts=()
source=()
md5sums=()

__gitroot=${url}
__gitname="unicode-haskell"

build() {
	cd ${srcdir}

	# Git checkout
	if [ -d ${srcdir}/${__gitname} ] ; then
		msg "Git checkout:  Updating existing tree"
		cd ${__gitname} && git checkout
		msg "Git checkout:  Tree has been updated"
	else
		msg "Git checkout:  Retrieving sources"
		git clone ${__gitroot} && cd ${__gitname} && git checkout
	fi
	msg "Checkout completed"
       }

package() {
        cd ${srcdir}/${__gitname}

	# creating directories 
	install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/ftplugin/haskell

	# copying files
	install -D -m 644 ftplugin/haskell/unicode-haskell.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/haskell/unicode-haskell.vim
}

