# Contributer: giacomogiorgianni@gmail.com

pkgname=easyimagesizer
_name=EasyImageSizer3
pkgver=3.0.5
pkgrel=2
license=('GPL3')
arch=('i686' 'x86_64')
depends=('qt4' 'exif' 'imagemagick' 'exiv2')
optdepends=()
pkgdesc="QT-version EasyImageSizer is a Programm to batch reduce filesize of images."
url="http://sourceforge.net/projects/easyimagesizer/"
makedepends=('gcc' 'pkgconfig' 'cmake')
conflicts=('eiskaltdcpp-svn' 'eiskaltdcpp' 'eiskaltdcpp-gtk' 'eiskaltdcpp-gtk-svn')
options=(!emptydirs)
#install=$pkgname.install
source=("http://freefr.dl.sourceforge.net/project/easyimagesizer/others/$_name-$pkgver.tar.gz")

build() {
  cd $srcdir/$_name
  cmake  -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_INSTALL_PREFIX=/usr -DPERL_REGEX=ON \
    -DUSE_JS=ON -DUSE_GTK=OFF -DLOCAL_BOOST=ON -DWITH_EXAMPLES=ON -DWITH_SOUNDS=ON \
    -DCMAKE_BUILD_TYPE=Release -DUSE_QT_QML=ON \
    
    
  make clean
  make DESTDIR=$pkgdir install
}

md5sums=('0680b8b13e3c4270e308065c60cb3966')
