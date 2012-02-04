# Maintainer: D. Can Celasun <dcelasun at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
pkgname=picapy
pkgver=1.8.0
pkgrel=1
pkgdesc='A Picasa Web manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/picapy/'
license=('GPL v3')
depends=('python-gdata' 'pycrypto' 'python2-gconf')
source=("http://launchpad.net/$pkgname/trunk/$pkgver/+download/${pkgname}_${pkgver}.orig.tar.gz"
picapy)

md5sums=('29f7ea06b07780e8927fc8124d25fb33'
'0e6401fdaecf532e4b0dba0986c19ccb')

build() {

cd $srcdir

export PYTHON="/usr/bin/python2"
sed -i 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' picapy.py
sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
-e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
$(find $srcdir -name '*.py')

sed -i 's|Exec=python|Exec=python2|' picapy.desktop

mkdir -p $pkgdir/usr/share/applications
mv picapy.desktop $pkgdir/usr/share/applications

mkdir -p $pkgdir/usr/share/pixmaps
mv picapy.svg $pkgdir/usr/share/pixmaps

mkdir -p $pkgdir/usr/bin
install -m755 $srcdir/picapy $pkgdir/usr/bin/picapy

mkdir -p $pkgdir/usr/share/picapy
mv * $pkgdir/usr/share/picapy
cd $pkgdir/usr/share/picapy/img
mv * $pkgdir/usr/share/picapy

rm -f $srcdir/picapy

}
