# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
pkgname=urandr
pkgver=0.1
pkgrel=3
pkgdesc="A GUI to RandR 1.2 written in PyGTK"
url="http://albertomilone.com/urandr.html"
license="GPL"
arch=('i686' 'x86_64')
depends=(pygtk)
source=("http://albertomilone.com/ubuntu/urandr/${pkgname}_${pkgver}+0ubuntu12-3.tar.gz")
md5sums=('08918b776aff78f7e46dcfd9e23a31d6')

build() {
  cd $startdir/src/ubuntu
  python setup.py install --prefix=$startdir/pkg/usr
}

