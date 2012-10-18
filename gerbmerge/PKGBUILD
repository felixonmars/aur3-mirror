# Contributor: Fabio Varesano <fvaresano@yahoo.it>
pkgname=gerbmerge
pkgver=1.8
pkgrel=2
pkgdesc="A program for combining (panelizing) the CAM data from multiple printed circuit board designs into a single set of CAM files."
arch=('i686' 'x86_64')
url="http://ruggedcircuits.com/gerbmerge/"
license=('GPL3')
depends=('python2' 'python2-simpleparse' 'python2-egenix-mx-base') 
source=('http://ruggedcircuits.com/gerbmerge/gerbmerge-1.8.tar.gz')
md5sums=('b34d86e47de1f5c9ce3d2d4c3b35662c')

build() {
  cd $startdir/src/gerbmerge-$pkgver
  sed -i 's/LIBPYTHON/LIBP/' setup.py
  python2 setup.py install --prefix=/usr --root=$startdir/pkg
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
  sed -i 's/python/python2/' $startdir/pkg/usr/bin/gerbmerge
  chmod 755 $startdir/pkg/usr/bin/gerbmerge
}
