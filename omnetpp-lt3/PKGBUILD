# Author: Adria Arrufat <swiftscythe@gmail.com>


pkgname="omnetpp-lt3"
_pkgname="omnetpp"
pkgver=3.3p1
pkgrel=2
pkgdesc="OMNeT++ is a discrete event simulation environment. Version used in LT3 at UPC"
url="http://www.omnetpp.org"
license="Academic Public License"
depends=('graphviz' 'giftrans' 'blt')
makedepends=('libxml2')
arch=('i686' 'x86_64')
install=omnetpp.install
source=(http://omnetpp.org/download/release/$_pkgname-$pkgver-src.tgz
	'omnetpp-3.3p1-gcc-4.4.patch')
md5sums=('172346e30cd7958da655213f5bd056ff'
         '517838dddbc626a8e176c87a592bdb09')
build() {
	cd ${startdir}/src/${_pkgname}-${pkgver}
	PATH=$PATH:${startdir}/src/${_pkgname}-${pkgver}/bin
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${startdir}/src/${_pkgname}-${pkgver}/lib 
	
	# patches
	patch -p1 < ../omnetpp-3.3p1-gcc-4.4.patch || return 1 
	sed "s|#OMNETPP_BITMAP_PATH=\"./bitmaps;\$OMNETPP_ROOT/bitmaps\"|OMNETPP_BITMAP_PATH=\"./bitmaps;/usr/share/omnetpp/bitmaps\"|" -i configure.user
	
	# configure
	./configure --prefix=/usr
	make -j 1|| return 1
	
	# install binaries
	mkdir -p ${startdir}/pkg/usr/bin
	install -m755 bin/* ${startdir}/pkg/usr/bin

	# change directories in opp_makemake
	sed "s|${startdir}/src/${_pkgname}-${pkgver}|/usr|g" -i ${startdir}/pkg/usr/bin/opp_makemake
	sed "s|OMNETPP_INCL_DIR=/usr/include|OMNETPP_INCL_DIR=/usr/include/omnetpp|" -i ${startdir}/pkg/usr/bin/opp_makemake
	
	# install libs
	mkdir -p ${startdir}/pkg/usr/lib
	install lib/* ${startdir}/pkg/usr/lib

	# install includes
	mkdir -p ${startdir}/pkg/usr/include/omnetpp
	mkdir -p ${startdir}/pkg/usr/include/omnetpp/platdep
	install -m644 include/*.h ${startdir}/pkg/usr/include/omnetpp
	install -m644 include/platdep/*.h ${startdir}/pkg/usr/include/omnetpp/platdep
	
	# install demos,doc and bitmaps
	install -d ${startdir}/pkg/usr/share/omnetpp/{bitmaps,doc,samples}
	cp -R bitmaps/* ${startdir}/pkg/usr/share/omnetpp/bitmaps
	cp -R doc/* ${startdir}/pkg/usr/share/omnetpp/doc
	cp -R samples/* ${startdir}/pkg/usr/share/omnetpp/samples
    
	
}
