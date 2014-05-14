# Maintainer:  Omid Nikta <omidnikta@gmail.com>
# Contributor: Omid Nikta <omidnikta@gmail.com>
 
pkgname=qtmind
pkgver=0.8.2
pkgrel=2
pkgdesc="A Mastermind Game With Built-in Solver. Integrated Solving Algorithms: Most Parts, Worst Case, Expected Size."
arch=('i686' 'x86_64')
url="http://omidnikta.github.io/qtmind/"
license=('GPL3')
depends=('qt4')
makedepends=('git')
optdepends=('pulseaudio: for game sound')
provides=('qtmind')
install=qtmind.install
url="http://omidnikta.github.io/qtmind/"
_gitroot='git://github.com/omidnikta/qtmind.git'
_gitname="master"
 

build() {
	cd ${srcdir}
	
	msg "Connecting to the GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin master && cd ..
		msg "The local files are updated."
	else
		git clone ${_gitroot} --single-branch ${_gitname}
	fi

	msg "Starting make..."

	qmake-qt4 ${srcdir}/${_gitname}
	make
}

package() {
	cd ${srcdir}
	make INSTALL_ROOT="${pkgdir}/" install
}
 
# vim: set ft=sh ts=2 sw=2 et:
