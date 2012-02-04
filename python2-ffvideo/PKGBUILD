# Maintainer: zhangkaizhao <zhangkaizhao@gmail.com>

pkgname=python2-ffvideo
pkgver=0.0.9
pkgrel=1
pkgdesc="FFVideo is a python extension makes possible to access to decoded frames at two format: PIL.Image or numpy.ndarray."
arch=(any)
url="http://bitbucket.org/zakhar/ffvideo/"
license=('GPL')
depends=('ffmpeg' 'python2')
source=("http://pypi.python.org/packages/source/F/FFVideo/FFVideo-0.0.9.tar.gz")
md5sums=('0c7da40e9898f1a500d685dfe53928d0')

build() {
    cd "$srcdir/FFVideo-$pkgver"
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}

