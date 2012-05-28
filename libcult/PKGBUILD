# Maintainer: kevku <kevku@gmx.com>
pkgname=libcult
pkgver=1.4.6
pkgrel=1
pkgdesc="A collection of C++ libraries"
arch=('x86_64' 'i686')
depends=('gcc-libs')
makedepends=('build')
url="http://kolpackov.net/projects/libcult"
license=('GPL2')
source=("ftp://kolpackov.net/pub/projects/$pkgname/1.4/$pkgname-$pkgver.tar.bz2"
	"gcc47.patch")
md5sums=('1526264fc4c08906537301f7a05f432c'
         '202e7573b8438ae99a2ac0902a982923')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -i "$srcdir/gcc47.patch"
  # never build the examples
  sed -i \
	-e 's| $(out_base)/examples/[[:alnum:]\.]*||' \
	-e '/examples\/makefile/d' \
	makefile || die "sed failed"
  #configuration
  mkdir -p build/{cxx/gnu,ld}
  cat >> build/configuration-dynamic.make <<- EOF
	cult_dr := y
	cult_threads := y
	cult_network := y
		EOF
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

  make
}
package() {
 cd "$srcdir/$pkgname-$pkgver"
 install -D cult/libcult.so $pkgdir/usr/lib/libcult.so
 find cult -iname "*.cxx" \
		-o -iname "makefile" \
		-o -iname "*.o" -o -iname "*.d" \
		-o -iname "*.m4" -o -iname "*.l" \
		-o -iname "*.cpp-options" -o -iname "*.so" | xargs rm -f
	rm -rf cult/arch
  mkdir $pkgdir/usr/include
  cp -r cult $pkgdir/usr/include
}
