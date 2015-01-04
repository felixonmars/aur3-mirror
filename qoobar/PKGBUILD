pkgname=qoobar
pkgver=1.6.6
pkgrel=1
pkgdesc="Qoobar - Audio Tagger for Classical Music. It can - Edit ID3v2.4, Xiph.org, APE, ASF tags."
arch=('i686' 'x86_64')
url="http://qoobar.sourceforge.net"
license=('GPL')
depends=('qt4' 'taglib' 'taglib-extras' 'librcd' 'libdiscid' 'enca' 'flac' 'shntool')
source=("http://downloads.sourceforge.net/sourceforge/qoobar/qoobar-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a4e1b9fe90fbc6cfa750876c72dbeddc')

build() {
  cd  "$srcdir/${pkgname}-${pkgver}"
  qmake-qt4 qoobar.pro PREFIX=/usr
  make
}

package() {  
 cd "$srcdir/${pkgname}-${pkgver}/"
 make INSTALL_ROOT=${pkgdir} install
}

