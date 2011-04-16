# Contributor: Andrea Zucchelli <zukka77@gmail.com>

pkgname=iptstate
pkgver=2.2.3
pkgrel=1
pkgdesc="top-like interface to netfilter connection-tracking table"
arch=('i686' 'x86_64')
url="http://www.phildev.net/iptstate/"
license=('custom')
depends=('ncurses' 'libnetfilter_conntrack')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
  install -D -m755 $pkgname $startdir/pkg/usr/sbin/$pkgname
  install -D -m644 $pkgname.8 $startdir/pkg/usr/share/man/man8/$pkgname.8
}
md5sums=('5238a0c4c4f764a919aba678051698ec')
