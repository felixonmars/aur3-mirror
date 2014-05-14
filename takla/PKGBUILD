# Maintainer:  Omid Nikta <omidnikta@gmail.com>
# Contributor: Omid Nikta <omidnikta@gmail.com>

pkgname=takla
pkgver=0.6.0
pkgrel=1
pkgdesc="Text And Keyboard Layout Analyzer."
arch=('i686' 'x86_64')
url="http://omidnikta.github.io/takla/"
license=('GPL3')
depends=('qt4')
makedepends=('git')
provides=('takla')
install=takla.install
url="http://omidnikta.github.io/takla/"
_gitroot='git://github.com/omidnikta/takla.git'
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
 