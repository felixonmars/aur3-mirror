# Contributor: Perttu Ahola <gmail/celeron55>
# Maintainer: Alex Hall <alumni.purdue.edu/hall12>

pkgname=opencamlib-svn
pkgver=786
pkgrel=1
pkgdesc="Multi-Purpose CNC Toolpath Library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/opencamlib/"
license=('GPL3')
makedepends=('git' 'python2' 'boost' 'cmake')
depends=('python2' 'boost')
provides=('opencamlib')
conflicts=('opencamlib')
source=('CMakeLists.txt.patch')
md5sums=('58e6fc1a69310d4096eae48941e56f8e')

_gitrepo=git://github.com/aewallin
_gitname=opencamlib
	

build() {
  cd "$srcdir"

	if [ -d $_gitname/.git ]; then
		cd $gitname
		git fetch
	else
		git clone $_gitrepo/$_gitname
		cd $_gitname
	fi

  msg "git clone done or server timeout"
	msg "Patching..."

	cd src
	patch < $srcdir/CMakeLists.txt.patch

  msg "Starting make..."

  cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make ocl || return 1
  make install DESTDIR=$pkgdir || return 1
}
