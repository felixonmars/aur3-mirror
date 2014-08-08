# Maintainer: Tim Diels <timdiels.m@gmail.com>
# Contributor: Dmitry A. Ilyashevich <dmitry.ilyashevich@gmail.com>

# Updated by Zifei Tong to add C headers and library

pkgname=distorm3
pkgver=3.3.0
pkgrel=2
pkgdesc="The ultimate disassembler (for AMD64, X86-64)"
url="http://code.google.com/p/distorm/"
license=('GPL')
depends=('python2')
arch=('i686' 'x86_64')
source=(http://distorm.googlecode.com/files/distorm3.zip
        distorm3-config.cmake)
md5sums=('2cd594169fc96b4442056b7494c09153'
         '4aaab06e41350ab53cc378c753f06787')

package() {
    cd $srcdir/distorm3
    python2 setup.py install --root=$pkgdir/ --optimize=1

    sed -i -e '1i#!/usr/bin/python2' $srcdir/distorm3/python/distorm3/sample.py

    install -D -m755 $srcdir/distorm3/python/distorm3/sample.py $pkgdir/usr/bin/disasm
    install -D $srcdir/distorm3/COPYING $pkgdir/usr/share/licenses/distorm/COPYING

    install -D $srcdir/distorm3/include/distorm.h $pkgdir/usr/include/distorm.h
    cd $pkgdir
    ln -s `find -name libdistorm3.so | sed 's|^.||'` $pkgdir/usr/lib/libdistorm3.so

    install -D -m 644 $srcdir/distorm3-config.cmake $pkgdir/usr/share/distorm3/distorm3-config.cmake
}

