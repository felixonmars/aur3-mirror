# Maintainer: Igor Nemilentsev <trezorg dog gmail dot com>

pkgname=python-pyffmpeg
pkgver=2.1beta
pkgrel=1
pkgdesc="PyFFmpeg is a wrapper around libavcodec, libavformat and libavutil FFmpeg libraries"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyffmpeg/"
license=('LGPL')
depends=('ffmpeg' 'python2' 'python-numpy')
makedepends=('cython')
source=("http://pyffmpeg.googlecode.com/files/pyffmpeg-${pkgver}.tar.gz" pyffmpeg.patch)
md5sums=('0a8900d596b87f3d36e2fe1c9b1c9c2a'
         'cf1e5d6389ba2609c32476ffffe7db13')



build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  patch -p0 < ../pyffmpeg.patch 
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
