# Maintainer: David Stelter <david.stelter@gmail.com>

pkgname='wake-compiler'
pkgver=v0.0.3
pkgrel=1
pkgdesc='Wake!'
arch=('x86_64')
url='http://www.wakelang.com'
license=('MIT')
makedepends=('git' 'boost' 'flex' 'bison')
source=('git+https://github.com/MichaelRFairhurst/wake-compiler.git')
md5sums=('SKIP')

_gitname=wake-compiler

#pkgver() {
#    cd $srcdir/$_gitname
#	git co v0.0.3
#    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
#}

build() {
    cd $srcdir/$_gitname
	git co $pkgver
    #./configure --prefix=/usr
	#./generate-makefile.sh
	# don't link against flex, leads to unresolved symbol yylex
	sed -i 's/-lfl//' makefile
    make TEST=false bin/wake
}

package() {
    cd $srcdir/$_gitname
    make prefix=${pkgdir}/usr install
	install -d ${pkgdir}/usr/share/licenses/wake/
	install -d ${pkgdir}/usr/share/doc/wake/
	install -m 0644 LICENSE.txt ${pkgdir}/usr/share/licenses/wake/
	install -m 0644 examples.wk ${pkgdir}/usr/share/doc/wake/
    #mkdir -p ${pkgdir}/lib/ocaml # ocamlfind won't do this itself...
    #make OCAMLFIND_LDCONF=${pkgdir}/tmp/ld.conf OCAMLFIND_DESTDIR=${pkgdir}/lib/ocaml install-findlib
}
