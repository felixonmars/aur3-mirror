#Maintainer: Mcder3 <mcder3[at]gmail[dot]com>
#Contributor: MisterFred <mister.fred[at]free[dot]fr>

pkgname=cantata
pkgver=0.8.2
pkgdesc="A KDE client for the music player daemon (MPD)."
pkgrel=1
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Cantata?content=147733"
license=(GPL)
makedepends=('cmake' 'automoc4')
provides=('cantata')
conflicts=('cantata-qt')
depends=('kdelibs' 'libmtp' 'mpg123' 'taglib' 'ffmpeg' 'taglib-extras')
optdepends=('speex: replaygain support')
install=${pkgname}.install
source=("http://cantata.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")
md5sums=('9bda49f1083820582723353f566268f3')

build(){	
  cd $srcdir/${pkgname}-${pkgver}
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make DESTDIR=${pkgdir} install
} 
