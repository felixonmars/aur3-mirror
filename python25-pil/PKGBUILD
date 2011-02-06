# Maintainer: Blake Imsland <blake@retroco.de>

pkgname=python25-pil
pkgver=1.1.7
pkgrel=2
pkgdesc="The Python Imaging Library (PIL) for Python 2.5"
arch=('i686' 'x86_64')
url="http://www.pythonware.com/products/pil/index.htm"
license=('custom:pil')
depends=('python25' 'libjpeg' 'freetype2')
makedepends=('tk')
source=(http://effbot.org/downloads/Imaging-$pkgver.tar.gz)
md5sums=('fc14a54e1ce02a0225be8854bfba478e')

build() {
  cd $srcdir/Imaging-$pkgver
  python2.5 setup.py build_ext
}

package() {
  cd $srcdir/Imaging-$pkgver
  python2.5 setup.py install --root=$pkgdir
  install -m 0755 -d $pkgdir/usr/include/python2.5
  install -m 0644 -t $pkgdir/usr/include/python2.5 libImaging/*.h

  for f in pilconvert pildriver pilfile pilfont pilprint; do
    mv $pkgdir/usr/bin/$f.py $pkgdir/usr/bin/$f-2.5
  done

  install -m 0644 -D $srcdir/Imaging-$pkgver/README \
                     $pkgdir/usr/share/licenses/$pkgname/README
}
