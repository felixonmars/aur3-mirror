# Contributor: Juan Diego Tascon

pkgname=osgart
pkgver=1.0
pkgrel=2
pkgdesc="Library that simplifies the development of augmented reality"
arch=('i686' 'x86_64')
url="http://www.artoolworks.com/community/osgart/index.html"
license=('GPL')
depends=('artoolkit' 'openscenegraph-uw')
source=("http://www.artoolworks.com/dist/osgart/release/${pkgver}/osgART-${pkgver}.tar.bz2")
md5sums=('740978cbdb6663f8bfd71086042f3cd4')

build() {
	# configure
	cd ${startdir}/src/osgART/bin
	
	export CXXFLAGS="${CXXFLAGS} -include cstring -include cstdlib -include iostream -include memory -include typeinfo"
	make CXXFLAGS="$CXXFLAGS" || return 1

	mkdir -p ${startdir}/pkg/usr/{lib,bin,share,include}
	cp -f *.so ${startdir}/pkg/usr/lib
	cp -f osgart_example ${startdir}/pkg/usr/bin
	cp -rf ../include/* ${startdir}/pkg/usr/include

	mkdir -p ${startdir}/pkg/usr/share/osgART/examples
	cp -rf Data images models shaders videos ${startdir}/pkg/usr/share/osgART

	cd ../src
	rm -rf osgART osgWrappers Scripts
	cp -rf * ${startdir}/pkg/usr/share/osgART/examples
}

