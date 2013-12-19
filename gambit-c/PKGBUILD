# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
_distname=gambc-v4_7_1
pkgname=gambit-c
pkgver=4.7.1
pkgrel=1
pkgdesc="Scheme R5RS interpreter and compiler (into portable C)"
arch=('i686' 'x86_64')
url='http://www.iro.umontreal.ca/~gambit/'
license=('LGPL2.1' 'Apache')
makedepends=('gcc')
source=(http://www.iro.umontreal.ca/~gambit/download/gambit/v4.7/source/${_distname}.tgz)
install='gambit-c.install'
sha1sums=('712645ac7fdda41a2a01af055a67ee6f1fba9fa7')

# Comment out the line below if you don't have about 500 megs of RAM and
# compilation fails...
_optimize=YUP

build()
{
    CFGOPTS='--prefix=/usr --docdir=/usr/share/doc/gambit-c
             --infodir=/usr/share/info
             --libdir=/usr/lib/gambit-c
             --enable-gcc-opts'

    if [ "$_optimize" ] ; then
        CFGOPTS="$CFGOPTS --enable-single-host"
    fi

    cd ${srcdir}/${_distname}
    ./configure ${CFGOPTS}
    make
}

package()
{
    cd ${srcdir}/${_distname}
    make install DESTDIR=${pkgdir}

    # gsc conflicts with the one provided by ghostscript...
    cd ${pkgdir}/usr/bin
    mv gsc gambitc
    rm gsc-script
    ln -s gambitc gsc-script
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 4
# End:
# vim:set ts=2 sw=2 et:
