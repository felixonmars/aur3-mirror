# Maintainer: WB2FKO <mph at sportscliche dot com>
pkgname=wsjt5
pkgver=5.9.7.r386
pkgrel=1
pkgdesc="Weak Signal Communication by K1JT"
arch=("i686")
url="http://www.physics.princeton.edu/pulsar/K1JT/"
license=("GPL")
depends=('python2' 'python-imaging' 'python2-numpy' 'libsamplerate' 'portaudio' 'fftw' 'g95')
source=(http://prdownload.berlios.de/wsjt/wsjt-$pkgver.tgz
        patch
        $pkgname.png
        $pkgname.desktop)
md5sums=('219d08442ceab62ba3f21c30705f2650'
         '3c28a97d157f5122607fc7915f9a0c06'
         'dd21318d4aa3423f1fbefc53061cc40d'
         'b07c1d24a4c042bbac8c9f2183c73747')

build() {
# Set the build environment to python2
 export PYTHON="/usr/bin/python2"
 export F2PY="/usr/bin/python2 f2py.py"
 unset LDFLAGS
 unset CFLAGS
# This patch grabs f2py2e from python2-numpy
  install -Dm644 patch $srcdir/wsjt-$pkgver/f2py.py
  
cd "$srcdir/wsjt-$pkgver"

# Make problems can sometimes be fixed by replacing g95 with gfortran 
./configure --prefix=/usr --enable-g95  
make
}

package(){
# Place the entire package in /opt  
   rm -rf $pkgdir/opt/$pkgname
   mkdir -p $pkgdir/opt/$pkgname
   mv $srcdir/wsjt-$pkgver $pkgdir/opt/$pkgname
   chown -R $USER:  $pkgdir/opt/$pkgname
   find "$pkgdir/opt/$pkgname/" -type f  | xargs chmod 644
   find "$pkgdir/opt/$pkgname/" -type d | xargs chmod 755

# Install a menu item with icon
  cd $srcdir
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png

  echo -e "\n WSJT will be installed in the /opt directory of root \n"
}

