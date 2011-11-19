# Maintainer: WB2FKO <mph at sportscliche dot com>
pkgname=wsjt7
pkgver=2031
pkgrel=2
pkgdesc="Weak Signal Communication by K1JT"
arch=('i686')
url="http://physics.princeton.edu/pulsar/K1JT/wsjt.html"
license=('GPL')
depends=('python2' 'python-imaging' 'python2-numpy' 'libsamplerate' 'portaudio' 'fftw' 'g95')
makedepends=('subversion')
source=(patch
        $pkgname.png
        $pkgname.desktop)
md5sums=('3c28a97d157f5122607fc7915f9a0c06'
         'dd21318d4aa3423f1fbefc53061cc40d'
         'e457496d3b6f60cd01e410043559eaed')

_svntrunk="svn://svn.code.sf.net/p/wsjt/code/trunk"
_svnmod="wsjt-code"

build() {
# Set the build environment to python2
 export PYTHON="/usr/bin/python2"
 export F2PY="/usr/bin/python2 f2py.py"
 unset LDFLAGS
 cd "$srcdir"

# This fetches a version of WSJT7 that can be built
  svn co -r 2031 $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
# This patch gets f2py2e from python2-numpy
  install -Dm644 patch $srcdir/$_svnmod-build/f2py.py
  cd "$srcdir/$_svnmod-build"

# Segmentation faults can sometimes be fixed by building with gfortran 
# instead of g95.  You may have to add --enable-alsa to the following 
# line if your soundcard is setup for ALSA.
  ./configure --prefix=/usr --enable-g95 
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
 # rm -rf build/
  python2 setup.py install --root=$pkgdir/ 
  sed -i 's:python:python2:g' wsjt
  install -Dm755 wsjt $pkgdir/usr/bin/wsjt

# Install a menu item with icon; copy supporting files
  cd $srcdir
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/wsjt
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cp -ra $srcdir/$_svnmod-build/RxWav/Samples/*.WAV $pkgdir/usr/share/wsjt/
  cp -ra $srcdir/$_svnmod-build/*.TXT $pkgdir/usr/share/wsjt/
  cp -ra $srcdir/$_svnmod-build/*.pdf $pkgdir/usr/share/wsjt/
  cp -ra $srcdir/$_svnmod-build/wsjtrc $pkgdir/usr/share/wsjt/
  cp -ra $srcdir/$_svnmod-build/*.dat $pkgdir/usr/share/wsjt/
}

