# Maintainer: perlawk

pkgname=gofer
pkgver=230b
pkgrel=1
pkgdesc="Gofer interpreter & compiler"
arch=('i686' 'x86_64')
url="http://web.cecs.pdx.edu/~mpj/goferarc/index.html"
license=('custom')
depends=()
source=(http://web.cecs.pdx.edu/~mpj/goferarc/gofer230b.tar.gz)

build() {
  cd "$srcdir/src"
	sed -i 's/#define SUNOS.*$/#define SUNOS 0/; s/#define LINUX.*$/#define LINUX 1/;' prelude.h
	sed -i 's!local/lib/Gofer!lib/gofer!;' cmachine.c
  make
}

mkexe() {
	cat > "$pkgdir"/usr/bin/gofer <<HERE
#!/usr/bin/bash
ROOT=/usr/lib/gofer
export GOFER=\${ROOT}/lib/standard.prelude
GOFERARGS=\${GOFERARGS-}
exec \${ROOT}/bin/gofer  \$GOFERARGS \$*
HERE

	sed -e 's!home/staff/ian!usr/lib!; s!/local/lib/Gofer!/lib/gofer/bin!; s!local/lib/Gofer!gofer/bin!; s/^echo/#echo/; s/^gcc/#gcc/; s/^strip/#strip/; s/^rm/#rm/;' \
		"$srcdir"/scripts/goferc > "$pkgdir"/usr/bin/gofc

	cat > "$pkgdir"/usr/bin/gofc2 <<HERE
#!/bin/bash
	#usage: gofc2 gofer_gen.c external.c 
	# see example in demos/CallingC and docment at release.230 for detail description
	# in short:
	# cd demos/CallingC
	# gofc gix1.gs
	# gofc2 gix1.c cix1.c
	# ./gix1
	if [ \$# -lt 2 ]; then
		echo usage: gofc2 gofer_gen.c external.c 
		exit
	fi
	CC=gcc
	out=\${1%%.c}
	gofer_genc=\$1
	shift 1
  \${CC} -o \${out}  /usr/lib/gofer/bin/runtime.o -lm -I/usr/lib/gofer/ \${gofer_genc} \$*
HERE

}

package() {
  cd "$srcdir/src"
	mkdir -p "$pkgdir"/usr/bin/
	mkdir -p "$pkgdir"/usr/lib/gofer/{bin,lib}
	mkdir -p "$pkgdir"/usr/share/man/man1

	cp gofc gofer runtime.o "$pkgdir"/usr/lib/gofer/bin/
	cp prelude.h gofc.h "$pkgdir"/usr/lib/gofer/
	cd ../
	cp *.prelude "$pkgdir"/usr/lib/gofer/lib/
	cp docs/*.1  "$pkgdir"/usr/share/man/man1
	mkexe
	chmod a+x "$pkgdir/"/usr/bin/gof*
}
md5sums=('6914ba677359e860a869073fb0f02eac')
