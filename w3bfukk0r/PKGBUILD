# Contributor: Daniel Hofer <d.hofer@pyro.at>
pkgname=w3bfukk0r
pkgver=0.2
pkgrel=1
pkgdesc="Scan webservers for hidden directories (forced browsing)"
arch=('i686')
url="http://www.ngolde.de/w3bfukk0r.html"
license='MIT'
depends=('openssl')
source=(http://www.ngolde.de/download/$pkgname-$pkgver.tar.gz)
md5sums=('53d88b42fb7ce424de0d63e7c798069a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make prefix=$startdir/pkg/usr install
  install -m644 -D words.txt $startdir/pkg/usr/share/$pkgname/words.txt
  install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
