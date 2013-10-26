# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=scilab4
pkgver=4.1.2
pkgrel=5
pkgdesc="Scilab is a scientific software package for numerical computations"
arch=('i686' 'x86_64')
url="http://www.scilab.org/"
license=('custom')
depends=('bash' 'tk85' 'tcl85' 'libgtkhtml' 'vte' 'gcc-libs' 'libxml2' 'libzvt' 'xaw3d' 'sablotron' 'gcc-fortran' 'ocaml')
makedepends=('libxt')
#source=(http://www.scilab.org/download/$pkgver/scilab-$pkgver-src.tar.gz \
source=(https://launchpad.net/ubuntu/+archive/primary/+files/scilab_4.1.2.orig.tar.gz \
  http://www.scilab.org/download/4.1.2/man-eng-scilab-$pkgver.tar.gz \
  http://www.scilab.org/download/4.1.2/man-fr-scilab-$pkgver.tar.gz \
  scilab4.desktop\
  scilab-4.1.2-gcc45.patch)
md5sums=('17a7a6aa52918f33d96777a0dc423658'
         '49f57fceba6a6aa03fa2e585b8e7156c'
         '5a0df745d529c73224f2dab6f268f3cb'
         'dfc9c8b86bb2539769f2d14c535ad0a1'
         '34c9a20ae9ae16d0e53e51229b31d75b')

build() {
  cd $srcdir/scilab-$pkgver
  patch -p0 < ../../scilab-4.1.2-gcc45.patch
  export MAKEFLAGS="-j1"
  [ "$CARCH" = "x86_64" ] && sed -i "s/CC_PLAT_OPTIONS='-march=athlon64 -mfpmath=sse -msse2 -m3dnow -m64'/CC_PLAT_OPTIONS='-march=x86-64 -mtune=generic -pipe'/" configure
  ./configure --prefix=/usr --with-gfortran --with-tk --without-pvm 
  make all || return 1
}
package(){
  make PREFIX=$pkgdir/usr install

  install -D -m644 X11_defaults/scilab.xpm $pkgdir/usr/share/icons/scilab4.xpm
  install -D -m644 license.txt $pkgdir/usr/share/licenses/scilab4/license.txt
  install -D -m644 $srcdir/scilab4.desktop $pkgdir/usr/share/applications/scilab4.desktop
  mv $pkgdir/usr/lib/scilab-$pkgver/ $pkgdir/usr/share/scilab-$pkgver/
  mkdir $pkgdir/usr/lib/scilab-$pkgver/
  cp  $srcdir/scilab-$pkgver/libs/*.a $pkgdir/usr/lib/scilab-$pkgver/

  sed -i -e "s=SCI\=\"$pkgdir/usr/lib/scilab-$pkgver\"=SCI\=\"/usr/share/scilab-$pkgver\"=" $pkgdir/usr/share/scilab-$pkgver/bin/scilab
  ln -fs /usr/share/scilab-$pkgver/bin/scilab $pkgdir/usr/bin/scilab4
  rm $pkgdir/usr/bin/scilab
  rm $pkgdir/usr/bin/intersci
  rm $pkgdir/usr/bin/intersci-n

  #ln -fs /usr/lib/scilab-$pkgver/bin/intersci $pkgdir/usr/bin/intersci
  #ln -fs /usr/lib/scilab-$pkgver/bin/intersci-n $pkgdir/usr/bin/intersci-n
}

