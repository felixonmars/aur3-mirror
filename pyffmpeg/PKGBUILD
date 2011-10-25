# Maintainer: Stephen Tanner <btreecat stephentanner dot com>

pkgname=pyffmpeg
pkgver=2.0
pkgrel=1
pkgdesc="PyFFmpeg provides a simple object oriented interface to libavcodec, libavformat and libavutil FFmpeg libraries"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pyffmpeg/"
license=('LGPL')
depends=('ffmpeg' 'python2' 'python2-numpy')
makedepends=('cython-old')
source=("http://pyffmpeg.googlecode.com/files/pyffmpeg-${pkgver}.tar.gz")
md5sums=('fee69342f9c7909bc0586c3e3cd4a6c2')



build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
