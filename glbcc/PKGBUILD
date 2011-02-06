# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=glbcc
pkgver=0.1.1
pkgrel=1
pkgdesc='GNU/Liberty Basic Compiler Collection (GLBCC) is a set of tools to allow Windows and Linux users to compile Liberty Basic code to standalone applications.'
arch=('i686' 'x86_64')
url='http://lbpp.sourceforge.net/'
license=('custom')
depends=('gtk')
makedepends=('gcc' 'pkgconfig' 'gtk' 'libgnomeui')
source=("http://prdownloads.sourceforge.net/lbpp/${pkgname}-${pkgver}-linux.tgz")
md5sums=('850c8c58c4520b28cb61fd9acd18bd46')

build() {
	cd "${srcdir}/${pkgname}-0.1.0"

	GLBCC_ROOT="$pkgdir/usr/lib/glbcc-lib/0.0.7"
	GLBCC_LIB="$GLBCC_ROOT/lib"

	GLBCC_LIB="${GLBCC_ROOT}/lib"
	GLBCC_XLIB="${GLBCC_ROOT}/xlib"
	GLBCC_INCLUDE="${GLBCC_ROOT}/include"

	GLBCC_SHARE="$pkgdir/usr/share/glbcc"
	GLBCC_BIN="$pkgdir/usr/bin"

	GLBCC_SPEC="${GLBCC_ROOT}/specs"
	GLBCC_XSPEC="${GLBCC_ROOT}/xspecs"

	if [ -z "$GLBCC_CORE" ]
	then
		export GLBCC_CORE=${GLBCC_SHARE}
	fi

	install -d ${GLBCC_LIB}
	install -d ${GLBCC_INCLUDE}

	make -C lbpp || return 1

	install -m555 lbpp/src/lbpp ${GLBCC_BIN}

	sed -i 's/gnome-config --cflags gnome/pkg-config --cflags libgnomeui-2.0/' './libLB/src/gui/gtk/Makefile'
	sed -i 's/#include <gtk\/gtk.h>/#define GTK_ENABLE_BROKEN\n#include <gtk\/gtk.h>/' './libLB/src/gui/gtk/text_window.c'
	sed -i 's/gnome-config --cflags gnomeui/pkg-config --cflags libgnomeui-2.0/' './config.h'
	sed -i 's/gnome-config --libs gnomeui/pkg-config --libs libgnomeui-2.0/' './config.h'

	make -C libLB clean all || return 1

	install -m444 libLB/lib/libLB.a ${GLBCC_LIB}
	install -m444 libLB/lib/lbcrt0.o ${GLBCC_LIB}

	for i in libLB/include/*
	do
		install -m444 $i ${GLBCC_INCLUDE}
	done

	rm -f ${GLBCC_SPEC}

        echo "${GLBCC_BIN}/lbpp -I${GLBCC_INCLUDE}" >> ${GLBCC_SPEC}
        echo "gcc" >> ${GLBCC_SPEC}
        echo "-g -I${GLBCC_INCLUDE} \`pkg-config --cflags gnomeui\`" \
             >> ${GLBCC_SPEC}
        echo "-L${GLBCC_LIB} -lLB -lm \`pkg-config --libs gnomeui\`" \
             >> ${GLBCC_SPEC}
        echo "${GLBCC_LIB}/lbcrt0.o" >> ${GLBCC_SPEC}

        rm -f glbcc/glbcc.bas
        echo -e "specs$$ = \"${GLBCC_SPEC}\"\nxspecs$$ = \"${GLBCC_XSPEC}\"" \
             | cat - glbcc/glbcc.tmpl > glbcc/glbcc.bas

        make -C glbcc bootstrap || return 1

        install -m555 glbcc/glbcc "$pkgdir/usr/bin"
}
