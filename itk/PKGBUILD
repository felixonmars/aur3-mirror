# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
pkgname=itk
pkgver=4.7
minorver=1
pkgrel=2
pkgdesc="ITK is an open-source software toolkit for performing registration and segmentation. "
arch=(x86_64 i686)
url="http://www.itk.org/"
license=('Apache License 2.0')
groups=()
depends=( )
makedepends=('cmake' 'boost')
optdepends=()
provides=('itk')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://cznic.dl.sourceforge.net/project/itk/itk/$pkgver/InsightToolkit-$pkgver.$minorver.tar.gz)
noextract=()
md5sums=('c2cbf3eb34df41548a5b9615ea250e7d')




 #generate with 'makepkg -g'

build() {
  echo $source
  cd $srcdir/  
  msg "Extracting archive..." 
  msg "starting make..."

  if [ ! -d "$srcdir/build/" ]; then
    mkdir $srcdir/build
  fi
  
  cd $srcdir/build


  cmake ../InsightToolkit-$pkgver.$minorver -DCMAKE_INSTALL_PREFIX=/usr
  make 
}

package() {

  
  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
}
