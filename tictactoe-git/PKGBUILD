# Contributor: Richard Kakaš <richard.kakas@gmail.com>

pkgname=tictactoe-git
pkgver=20100503
pkgrel=1
pkgdesc="Simple TicTacToe game made in Qt."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/tictactoe-qt/"
license=('GPL')

depends=('qt')
makedepends=('cmake' 'git')
provide=('tictactoe')
conflicts=('tictactoe')

install=("tictactoe-git.install")

_gitroot="git://tictactoe-qt.git.sourceforge.net/gitroot/tictactoe-qt/tictactoe-qt"
_gitname="tictactoe"

build() {
	# update/download git files
	cd ${srcdir}/
    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}/
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot} ${_gitname}
    fi
	# checkout of actual/working branch
	cd ${srcdir}/${_gitname}
	git checkout new_version
	msg "GIT checkout done."

	# building and installing of project
    msg "Starting building...."
	cmake -D CMAKE_INSTALL_PREFIX=/usr . || return 1
	make clean || return 1
	make all || return 1
	make DESTDIR="${pkgdir}" install || return 1
    msg "Build done."
}

