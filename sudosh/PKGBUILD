# Maintainer: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=sudosh
pkgver=1.8.2
pkgrel=2
pkgdesc="sudosh is a sudo shell, filter and can be used as a login shell."
arch=('i686' 'x86_64')
url="http://sudosh.sf.net"
license=('OSL')
depends=('perl')
install=sudosh.install
source=("http://downloads.sourceforge.net/sudosh/$pkgname-$pkgver.tar.gz"
        'sudosh.install'
        'sudosh.conf')
md5sums=('7121efdac817e4a27111869f27fabea0'
         'ad83ea4624297b35f8f7c3ca30d087c8'
         '5ed046bbd764ad1a73862d1ba558fa51')

build() {
  cd $srcdir
  install -D -m644 sudosh.conf ${pkgdir}/etc/sudosh.conf

  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make prefix=/usr bindir=${pkgdir}/usr/bin mandir=${pkgdir}/usr/share/man install || return 1
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING || return 1

  install -dD -m733 ${pkgdir}/var/log/sudosh
}
