# Contributor: Imanol Celaya <ilcra1989@gmail.com>

pkgname=veohproxy
pkgver=1.51
pkgrel=1
pkgdesc="Downloads videos from veoh Ninjavideo and Messagefromme"
arch=('i686', 'x86_64')
url="http://code.google.com/p/veohproxy/"
license=('GPL')
depends=('python')
makedepends=('unzip')
source=(http://veohproxy.googlecode.com/files/$pkgname-$pkgver-src.zip veohproxy.sh)
md5sums=('7de60d35fde3494723fc3c0491dd2770'
         '8109e121824dd0ddbac1e0bc1bb51124')

build() {
  cd "$srcdir/VeohProxy-$pkgver"

  for file in $(ls); do
  
  install -Dm644 $file $pkgdir/opt/veohproxy/$file

  done
  
  install -Dm755 $srcdir/veohproxy.sh $pkgdir/usr/bin/veohproxy || return 1
}

