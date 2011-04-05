# Contributer Jonathan Frazier eyeswide@gmail.com

pkgname=openal-svn
pkgver=1442
pkgrel=1
pkgdesc="built without esd or oss output (so it uses alsa), and a patch to fix the nasty clicking"
url="http://www.openal.org/"
license="GPL"
makedepends=('subversion' 'yasm' 'cmake' 'rsync')
conflicts=('openal')
provides=('openal')
options=('!libtool')
arch=('i686')
source=(al_filter.patch)

md5sums=('d6ef4da923fa21d7a5413687394ac145')

_svntrunk=svn://connect.creativelabs.com/OpenAL
_svnmod=openal

build() {
	cd $startdir/src

	# Get Latest Source Code
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	rm -rf build
	rsync -a $_svnmod/ build/ || return 1	
	cd build || return 1
	#
	# patch for filter clicks
	patch -d src -Np0 -i ${startdir}/src/al_filter.patch || return 1

	# Install
	cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr -DALSA:BOOL=ON \
		-DALSA_DLOPEN:BOOL=ON -DBUILD_STATIC:BOOL=OFF \
		-DBUILD_TESTS:BOOL=OFF -DCMAKE_BUILD_TYPE:STRING=none \
		-DNATIVE:BOOL=ON -DNULLOUT:BOOL=ON -DOPTIMIZATION:BOOL=ON \
		-DOSS:BOOL=OFF -DSDL:BOOL=ON -DSDL_DLOPEN:BOOL=ON \
		-DVORBIS:BOOL=ON -DVORBIS_DLOPEN:BOOL=ON -DWARNINGS:BOOL=ON \
		-DWAVEOUT:BOOL=ON -DESD:BOOL=OFF || return 1
      	make || return 1
	make DESTDIR=$startdir/pkg install
	sed -i -e 's/@requirements@//' ${startdir}/pkg/usr/lib/pkgconfig/openal.pc || return 1

}

