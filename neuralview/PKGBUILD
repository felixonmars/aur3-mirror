# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=neuralview
pkgver=1.5.0
pkgrel=1
pkgdesc="Neural Network simulator"
arch=('i686' 'x86_64')
url="http://oproj.tuxfamily.org" 
depends=('lua51' 'lgob>=13.10' 'lcl>=1.1.0' 'lfann>=1.3.0')
optdepends=('gnuplot: error plotting')
license=(LGPL)
source=(https://bitbucket.org/lucashnegri/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=("d978dd8e63e086dd4bf0ecb6ebed9bce")

package() { 
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR=$pkgdir/opt/neuralview || 1
  
  APPDIR=$pkgdir/usr/share/
  mkdir -p $APPDIR
  cp neuralview.desktop $APPDIR
}
