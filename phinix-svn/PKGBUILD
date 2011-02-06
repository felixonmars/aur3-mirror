pkgname=phinix-svn
pkgver=75
pkgrel=1
pkgdesc="Just an audio player"
arch=('i686' 'x86_64')
url=('http://phinix.sourceforge.net/')
license=('GPL')
depends=('qt' 'phonon')
makedepends=('make' 'subversion')
source=('phinix.desktop')
noextract=()
md5sums=('7ab234e3d97ebe71b6c64b8bb859552b')

_svntrunk=https://svn.sourceforge.net/svnroot/phinix/trunk/
_svnmod=phinix

build() {
	cd $srcdir

	# Gets lasts svn version
	if [ -d $_svnmod/.svn ]; then
		(cd $svnmod && svn up)
	else
		svn co $_svntrunk --config-dir ./ $_svnmod
	fi

	cd $_svnmod

	# Compilation
	qmake || return 1
	make || return 1
	
	# install
	mkdir -p $startdir/pkg/usr/share/applications/
	install -D -m644 $startdir/phinix.desktop $startdir/pkg/usr/share/applications/
	
	mkdir -p $startdir/pkg/usr/bin
	cp $startdir/src/phinix/bin/Phinix $startdir/pkg/usr/bin/phinix
}

