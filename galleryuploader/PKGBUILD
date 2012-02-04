# Contributor: Bernhard Tittelbach <xro@realraum.at>

pkgname=galleryuploader
pkgver=2.3
pkgrel=1
pkgdesc="An Python Uploader Script for Gallery2 that can be used with nautilus"
arch=('i686' 'x86_64')
url="http://www.pietrobattiston.it/gallery_uploader"
license=('GPL')
depends=('python2' 'galleryremote' 'pygtk')
source=(http://www.pietrobattiston.it/_media/gallery_uploader:gallery-uploader-$pkgver.tar.gz)
md5sums=('d9f604eb08207a585412484538056d90')

build() {
  cd $startdir/src/gallery-uploader-$pkgver
  python2 setup.py install --root=${pkgdir}
}
