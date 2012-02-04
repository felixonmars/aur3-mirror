# Sam May <sam.m4y@gmail.com>
pkgname=lisp-unit
pkgver=1.0
pkgrel=1
pkgdesc="A simple-to-use unit testing library for Common Lisp"
license=('custom')
arch=('i686' 'x86_64')
install=('lisp-unit.install')
depends=('clisp' 'cl-asdf')
url="http://www.cs.northwestern.edu/academics/courses/325/readings/lisp-unit.html"
source=("http://www.geocities.com/reuben_cornel/lisp-unit_${pkgver}.tar.gz")
md5sums=('8a60c64e52c2811f9657c01f51431d3c')

_lispdir=$startdir/pkg/usr/share/common-lisp
build() {
    install -d $_lispdir/source/lisp-unit
    install -m 644 -t $_lispdir/source/lisp-unit/ \
	$startdir/src/lisp-unit/lisp-unit.lisp \
	$startdir/src/lisp-unit/lisp-unit.asd

    install -d $_lispdir/systems/
    pushd $_lispdir/systems
    ln -s ../source/lisp-unit/lisp-unit.asd .
    popd

    install -D -m 644  $startdir/LICENSE \
	$startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
