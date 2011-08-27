# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-imaging
_pkgname=python-imaging
pkgver=1.1.7
pkgrel=1
pkgdesc="PIL. Provides image processing capabilities for python"
arch=('i686' 'x86_64')
url="http://www.pythonware.com/products/pil/index.htm"
license=('custom:"pil"')
depends=('python26' 'libjpeg' 'freetype2')
makedepends=('tk' 'sane')
optdepends=('tk' 'sane')
source=("http://effbot.org/downloads/Imaging-$pkgver.tar.gz")
md5sums=('fc14a54e1ce02a0225be8854bfba478e')

build() {
 cd "$srcdir/Imaging-$pkgver"
 python26 setup.py build_ext
 cd Sane
 python26 setup.py build_ext
}

package() {
 cd "$srcdir/Imaging-$pkgver"
 python26 setup.py install --root="$pkgdir"
 
 pushd Sane
 python26 setup.py install --root="$pkgdir"
 popd
 
 install -dm 755 "$pkgdir/usr/include/python2.6/"
 install -m 644 -t "$pkgdir/usr/include/python2.6/" libImaging/*.h 

 # do not have files ending in .py in /usr/bin
 for f in pildriver pilprint pilconvert pilfile pilfont; do
   mv "$pkgdir/usr/bin/$f"{.py,}
 done

 # Install license
 install -Dm 644 "$srcdir/Imaging-$pkgver/README" "$pkgdir/usr/share/licenses/$pkgname/README"

 # Remove binaries to prevent package conflicts
 rm -rv "$pkgdir/usr/bin"
}
