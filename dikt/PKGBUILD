pkgname=dikt
pkgver=2j
pkgrel=2
pkgdesc="Dictionary - Kde Dict client"
arch=('i686' 'x86_64')
url="http://dikt.googlecode.com/"
license=('custom')
depends=('kdebase-runtime')
source=(http://dikt.googlecode.com/files/$pkgname-$pkgver.txz)
md5sums=('cf79e5f4c114d43732f32b42a8250296')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release . || return 1  
  }
  
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install || return 1 
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  
  }

