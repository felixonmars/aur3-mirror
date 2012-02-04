# Maintainer: Andrej S. Prokhorenkov <andrej.prokhorenkov@gmail.com>
# Contributor: Andrej S. Prokhorenkov <andrej.prokhorenkov@gmail.com>
pkgname=kronikarz-git
pkgver=20100831
pkgrel=1
pkgdesc="A small, easy-in-use backup tool, desgined to be lightweight and simple."
arch=('any')
url="http://kronikarzproject.wordpress.com/"
license=('GPL')
groups=()
depends=('python' 'pyqt' 'sqlite3')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/m0nhawk/kronikarz.git"
_gitname="kronikarz"
_gitbranch="master"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server..."

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin ${_gitbranch}
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/${_gitname}
	git checkout -f ${_gitbranch}
	git checkout remotes/origin/${_gitbranch}

	#
	# BUILD HERE
	#

#	./autogen.sh
#	./configure --prefix=/usr
#	make || return 1
	make DESTDIR="$pkgdir/" install
}
