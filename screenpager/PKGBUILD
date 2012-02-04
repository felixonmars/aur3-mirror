# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=screenpager
pkgver=0.1.2
pkgrel=1
pkgdesc="Screenwise desktop pager for Xinerama"
arch=('any')
url="http://zelea.com/project/screenpager/introduction.html"
license=('custom')
depends=('perl' 'perl-tk' 'perl-x11-protocol' 'xosd' 'wmctrl')
source=(http://zelea.com/project/${pkgname}/release/$pkgname-$pkgver.tar.gz
	license.txt)
md5sums=('d983a94c3f788f6f807547b87982497b'
	'f3e2ccb2f4797fc91d8abdbc0953a69f')

build() {
  cd $srcdir
  mkdir -p $pkgdir/etc/xdg
  cp -r etc/xdg/$pkgname $pkgdir/etc/xdg/$pkgname || return 1
  install -D -m755 usr/bin/$pkgname $pkgdir/usr/bin/$pkgname || return 1
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
