# Contributor: Bernhard Tittelbach <xro@realraum.at>

pkgname=galleryremote
pkgver=0.5
pkgrel=1
pkgdesc="GalleryRemote is a Python package for communicating with Gallery installations using the Gallery Remote Protocol"
arch=('i686' 'x86_64')
url="http://code.google.com/p/galleryremote/"
license=('LGPL')
depends=('python2')
source=(http://galleryremote.googlecode.com/files/GalleryRemote-$pkgver.tar.gz)
md5sums=('a37975af4d23741c50f58aa40f68a3b5')

build() {
  cd $startdir/src/GalleryRemote-$pkgver
  python2 setup.py install --root=${pkgdir}
}
