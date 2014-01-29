# Maintainer: jokot3 <jokot3 at gmail dot com>
# Adapted from graphiz package by: Gaetan Bisson <bisson@archlinux.org>

_pkgname=graphviz
pkgname=graphviz-nox
pkgver=2.34.0
pkgrel=3
pkgdesc='Graph visualization software. With only python/perl/guile support'
url='http://www.graphviz.org/'
license=('CPL')
arch=('i686' 'x86_64')
provides=('graphviz')
conflicts=('graphviz')
#depends=('libltdl' 'gd' 'librsvg' 'libxaw' 'ghostscript' 'pango' 'gts')
depends=('libltdl')
#makedepends=('swig' 'mono' 'guile' 'lua51' 'ocaml' 'perl' 'php' 'python2' 'r' 'tk' 'qt4')
makedepends=('python2' 'guile' 'perl')
optdepends=('mono: sharp bindings'
            'guile: guile bindings'
            'lua51: lua bindings'
            'ocaml: ocaml bindings'
            'perl: perl bindings'
            'php: php bindings'
            'python2: python bindings'
            'r: r bindings'
            'tcl: tcl bindings'
            'qt4: gvedit')
source=("${url}/pub/${_pkgname}/stable/SOURCES/${_pkgname}-${pkgver}.tar.gz"
        'yyerror0.patch'
        'yyerror1.patch'
        'dotty.patch')
sha1sums=('5a0c00bebe7f4c7a04523db21f40966dc9f0d441'
          '7a6fe4f532974d9ca173b1aba9927bdeb5f80be9'
          '6d76a230ee6c11bcd610ebe56f98e96ecef6217d'
          '31bc9f505c8b6470289a0d6ec31c237765cba239')

install=install

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i ../yyerror0.patch
	patch -p1 -i ../yyerror1.patch
	patch -p1 -i ../dotty.patch
	sed \
		-e '/LIBPOSTFIX="64"/d' \
		-i configure
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	export PYTHON=python2
	#export LUA=lua5.1

	./configure --prefix=/usr \
	--enable-swig=no \
	--enable-sharp=no \
	--enable-go=no \
	--enable-guile=yes \
	--enable-io=no \
	--enable-java=no \
	--enable-lua=no \
	--enable-ocaml=no \
	--enable-perl=yes \
	--enable-php=no \
	--enable-python=yes \
	--enable-python23=no \
	--enable-python24=no \
	--enable-python25=no \
	--enable-python26=no \
	--enable-python27=no \
	--enable-r=no \
	--enable-ruby=no \
	--enable-tcl=no \
	--without-x \
	--without-rsvg \
	--without-pangocairo \
	--without-ghostscript \
	--without-lasi \
	--without-gtk \
	--without-qt \
	--without-libgd \
	--without-gts \
	--without-Xaw

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

