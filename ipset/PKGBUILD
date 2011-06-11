pkgname=ipset-new
pkgver=6.7
pkgrel=1
pkgdesc="Iptables extension, allowing treatment of large sets of hosts/nets as a single iptables entry"
arch=(i686 x86_64)
url="http://ipset.netfilter.org"
license=('GPL2')
depends=('libmnl')
source=(http://ipset.netfilter.org/ipset-$pkgver.tar.bz2)
md5sums=('6331ff18443ec07fb7540e668c4fe38c')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
