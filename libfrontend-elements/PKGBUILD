# Maintainer: kevku <kevku@msn.com>
pkgname=libfrontend-elements
pkgver=1.1.4
pkgrel=1
pkgdesc="A collection of elementary building blocks for implementing compiler frontends in c++"
arch=('x86_64' 'i686')
depends=('libcult')
makedepends=('build')
url="http://kolpackov.net/projects/libfrontend-elements"
license=('GPL2')
source=("ftp://kolpackov.net/pub/projects/$pkgname/1.1/$pkgname-$pkgver.tar.bz2")
md5sums=('d086e872cacdf3c3fa2e07f11ec08acd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #configuration
  sed -i \
		-e 's| $(out_base)/examples/[[:alnum:]\.]*||' \
		-e '/examples\/makefile/d' \
		makefile || die "sed failed"

  mkdir -p build/{cxx/gnu,ld}

  cat >> build/cxx/configuration-dynamic.make <<- EOF
	cxx_id       := gnu
	cxx_optimize := n
	cxx_debug    := n
	cxx_rpath    := n
	cxx_pp_extra_options :=
	cxx_extra_options    := ${CXXFLAGS}
	cxx_ld_extra_options := ${LDFLAGS}
	cxx_extra_libs       :=
	cxx_extra_lib_paths  :=
		EOF

  cat >> build/cxx/gnu/configuration-dynamic.make <<- EOF
	cxx_gnu := g++
	cxx_gnu_libraries :=
	cxx_gnu_optimization_options :=
		EOF

  cat >> build/ld/configuration-lib-dynamic.make <<- EOF
	ld_lib_type   := shared
		EOF
  cat >> build/import/libcult/configuration-dynamic.make <<- EOF
	libcult_installed := y
		EOF

  make
}
package() {
 cd "$srcdir/$pkgname-$pkgver"
 install -D frontend-elements/libfrontend-elements.so $pkgdir/usr/lib/libfrontend-elements.so
  find frontend-elements -iname "*.cxx" \
		-o -iname "makefile" \
		-o -iname "*.o" -o -iname "*.d" \
		-o -iname "*.m4" -o -iname "*.l" \
		-o -iname "*.cpp-options" -o -iname "*.so" | xargs rm -f
  mkdir $pkgdir/usr/include
  cp -r frontend-elements $pkgdir/usr/include
}
