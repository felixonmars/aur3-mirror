# Maintainer: Wang Lun <iseuer@gmail.com>
pkgname=brasd
pkgver=0.1.2
_pkgver=0.1
pkgrel=1
pkgdesc="an unofficial client of Southeast University BRAS service, which helps Linux users quickly use BRAS."
url="http://bbs.seu.edu.cn"
arch=('i686' 'x86_64')
license=('Public Domain Mark')
depends=('xl2tpd')
makedepends=('libevent' 'gtkmm' 'automake' 'autoconf')
install=${pkgname}.install
source=("http://launchpad.net/brasd/${_pkgver}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
        'brasd')
md5sums=('25559b9c6e9d94ca0fe9b7a568735092'
         'baa2491dfc2ea201c7dc12378ac8b2aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm755 ${srcdir}/brasd ${pkgdir}/etc/rc.d/brasd
}

# vim:set ts=2 sw=2 et:
