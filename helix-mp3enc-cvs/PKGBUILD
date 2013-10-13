# Maintainer: maep <m.aep at live com>

# I realize this is quite hackish, but there is no public CVS access except through
# the web frontend. And there are no makefiles so I just manally build the sources.

pkgname=helix-mp3enc-cvs
pkgver=5.1
pkgrel=0
pkgdesc="A fast command line mp3 encoder. Based on the Xing encoder, RealNetworks released the source as part of Helix DNA project."
url='http://helixcommunity.org'
arch=('x86_64' 'i686')
license=('custom')
depends=('glibc')
makedepends=('wget')

_repo='http://helixcommunity.org/viewcvs/*checkout*/datatype/mp3/codec'
_src='amodini2.c bitallo.cpp bitallo1.cpp bitallo3.cpp bitalloc.cpp bitallos.cpp bitallosc.cpp cnt.c cnts.c cnttab.h detect.c emap.c emdct.c filter2.c htable.h hwin.c l3init.c l3map.h l3math.c l3pack.c l3tcp.h mhead.c mhead.h mp3enc.cpp mp3low.h pcmhpm.c pow34.c sbt.c setup.c spdsmr.c srcc.cpp srccf.cpp srccfb.cpp tableaw2.h tat.h tcp.h xhead.c xhwin.c xsbt.c'
_src_pub='amod.h balow.h bitallo.h bitallo1.h bitallo3.h bitallos.h enc.h encapp.h filter2.h hxtypes.h l3e.h mp3enc.h pcmhpm.h srcc.h xhead.h'
_src_test='port.h tomp3.cpp'
_cflags='-Ofast -DIEEE_FLOAT' # -Wall creates too much noise

prepare() {
    # manually fetch every file from public cvs repo 
    for _file in $_src; do
        wget -nv $_repo/encoder/$_file
    done
    for _file in $_src_pub; do
        wget -nv $_repo/encoder/pub/$_file
    done
    for _file in $_src_test; do
        wget -nv $_repo/encoder/test/$_file
    done
    wget -nv $_repo/RPSL.txt
}

build() {
    # no make :)
    for _file in `ls *.c`; do
        cc $_cflags -c $_file
    done
    for _file in `ls *.cpp`; do
        c++ $_cflags -c $_file
    done
    c++ `ls *.o` -o mp3enc
}

package() {
    install -Ds $srcdir/mp3enc $pkgdir/usr/bin/mp3enc
    install -Dm644 RPSL.txt $pkgdir/usr/share/licenses/$pkgname/RPSL.txt
}
