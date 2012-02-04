# Maintainer: kevku <kevku@msn.com>
pkgname=libbackend-elements
pkgver=1.7.2
pkgrel=1
pkgdesc="A collection of elementary building blocks for implementing compiler backends in c++"
arch=('x86_64' 'i686')
makedepends=('build' 'boost-libs' 'libcult')
url="http://www.kolpackov.net/projects/libbackend-elements"
license=('GPL2')
source=("ftp://kolpackov.net/pub/projects/$pkgname/1.7/$pkgname-$pkgver.tar.bz2")
md5sums=('1b7548faf0d20f90cb754b73ee3bd5b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #configuration
  mkdir -p build/{ld,cxx/gnu,import/libboost,import/libcult}

  cat >> build/cxx/configuration-dynamic.make <<- EOF
	cxx_id       := gnu
	cxx_optimize := n
	cxx_debug    := n
	cxx_rpath    := n
	cxx_pp_extra_options :=
	cxx_extra_options    := ${CXXFLAGS} -I/usr/include/boost
	cxx_ld_extra_options := ${LDFLAGS}
	cxx_extra_libs       :=
	cxx_extra_lib_paths  :=
		EOF

  cat >> build/cxx/gnu/configuration-dynamic.make <<- EOF
	cxx_gnu := g++
	cxx_gnu_libraries :=
	cxx_gnu_optimization_options :=
		EOF


  cat >> build/import/libboost/configuration-dynamic.make <<- EOF
	libboost_installed := y
	libboost_suffix :=
		EOF

  cat >> build/import/libcult/configuration-dynamic.make <<- EOF
	libcult_installed := y
		EOF

  cat >> build/ld/configuration-lib-dynamic.make <<- EOF
	ld_lib_type   := shared
		EOF


  make
}
package() {
 cd "$srcdir/$pkgname-$pkgver"
 find backend-elements -iname "*.cxx" \
		-o -iname "makefile" \
		-o -iname "*.o" -o -iname "*.d" \
		-o -iname "*.m4" -o -iname "*.l" \
		-o -iname "*.cpp-options" -o -iname "*.so" | xargs rm -f
	rm -rf backend-elements/arch
  mkdir -p $pkgdir/usr/include
  cp -r backend-elements $pkgdir/usr/include
}
