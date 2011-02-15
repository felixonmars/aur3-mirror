# Contributor: Apkawa <apkawa@gmail.com>

pkgname=pyqrcodec
pkgver=1.0
pkgrel=2
pkgdesc="PyQrCodec is a Python module for encoding and decoding QrCode images."
arch=('i686' 'x86_64')
url="http://www.pedemonte.eu/pyqr/index.py/pyqrhome"
license=('LGPL')
makedepends=('gcc' 'opencv')
depends=('python2' 'pil')
source=("http://pypi.python.org/packages/source/q/qr-codec/qr_codec-1.0.tar.gz")
md5sums=('2ace73137bae12deadb0ebcb9dce4424')

build() {
  cd $startdir/src/PyQrCodec
  #TODO: fix make

  python2 setup.py install --root=$startdir/pkg

}
