# Maintainer: WB2FKO <mph at sportscliche dot com>
pkgname=wspr
pkgver=2.00.r1714
pkgrel=2
pkgdesc="Weak Signal Propagation Reporter"
arch=("i686")
url="http://www.physics.princeton.edu/pulsar/K1JT/wspr.html"
license=("GPL")
depends=('python2' 'python-imaging' 'python2-numpy' 'libsamplerate' 'portaudio' 'fftw' 'g95')
source=(http://www.physics.princeton.edu/pulsar/K1JT/$pkgname-$pkgver.tgz
        $pkgname.png
        $pkgname.desktop)
md5sums=('89bb985d99e777de054a9c1642a941c5'
         'dd21318d4aa3423f1fbefc53061cc40d'
         'b5eb504a0fc6b91a98c86f4074676e30')

build() {
# Set the build environment to python2
 export PYTHON="/usr/bin/python2"
 export F2PY="/usr/bin/python2 f2py.py"
 unset LDFLAGS
  
cd "$srcdir/$pkgname-$pkgver"

# Make problems can sometimes be fixed by replacing g95 with gfortran 
./configure --prefix=/usr --enable-g95
make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf build/
  python2 setup.py install --root=$pkgdir/ 
  sed -i 's:python:python2:g' wspr
  install -Dm755 wspr $pkgdir/usr/bin/wspr

# Install a menu item with icon
  cd $srcdir
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
#  install -Dm644 LICENSE.TXT $pkgdir/usr/share/doc/${pkgname}/LICENSE.TXT
  cp -ra $srcdir/$pkgname-$pkgver/*.TXT $pkgdir/usr/share/doc/${pkgname}/
}

