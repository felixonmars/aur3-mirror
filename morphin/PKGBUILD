# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jeffrey Park <jeffrey.parke@gmail.com>

pkgname=morphin
pkgver=0.0.5
pkgrel=2
pkgdesc="A simple video player based on Python2, Gtk+ and Gstreamer"
arch=('i686' 'x86_64')
license=('gpl')
url="http://code.google.com/p/morphin/"
depends=('pygtk' 'gstreamer0.10-base' 'kiwi' 'python-configobj' 'pyxdg' 'gstreamer0.10-python' )
makedepends=('python2-distribute')
source=(http://morphin.googlecode.com/files/${pkgname}_v${pkgver}-Alpha.tar.gz
    setup.patch)
md5sums=('1551034afa61427be80bb679e64af3cc'
         '8f32b46f836c22307fdd5616d8c1ba19')

build() {
    # python2 fix
    for file in $(find . -name '*.py' -print); do
       sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
       sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done

    cd ${srcdir}/${pkgname}_v${pkgver}
    patch -Np0 -i ${srcdir}/setup.patch
    python2 setup.py install --root=${pkgdir}

    # Creating the new bin
    cd $pkgdir/usr/bin
    echo "#!/bin/sh" > morphin
    echo "exec python2 /usr/lib/python2.7/site-packages/morphin/morphin.py \"\$@\"" >> morphin
}
