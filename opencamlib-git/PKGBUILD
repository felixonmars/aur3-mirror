# Contributor: Perttu Ahola <gmail/celeron55>
# Contributor: Alex Hall <alumni.purdue.edu/hall12>
# Maintainer: Mathieu Gaborit <mat.gaborit@gmx.com>

pkgname=opencamlib-git
pkgver=1
pkgrel=3
pkgdesc="Multi-Purpose CNC Toolpath Library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/opencamlib/"
license=('GPL3')
makedepends=('git' 'python2' 'boost' 'cmake')
depends=('python2' 'boost')
provides=('opencamlib')
conflicts=('opencamlib')
source=('CMakeLists.txt.patch')
md5sums=('5f6201515ed94870ddc487e102932a43')

_gitname=opencamlib
_gitrepo=http://github.com/aewallin/$_gitname


build() {
  cd "$srcdir"

	if [ -d $_gitname/.git ]; then
		cd $gitname
		git fetch
	else
		git clone $_gitrepo
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
