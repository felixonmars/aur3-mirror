# Contributer: Nat

pkgname=centbar
pkgver=1.20
pkgrel=1
pkgdesc="从fbpanel修改而来的面板（panel）"
url="http://code.google.com/p/centbar/"
#groups=()
depends=('gtk2' 'libxmu')
license="GPL"
backup=('etc/xdg/centbar/config.conf' 'etc/xdg/centbar/panel.conf' 'etc/xdg/centbar/theme.conf' \
		'etc/xdg/centbar/menu.conf')
source=(http://centbar.googlecode.com/files/$pkgname-$pkgver-src.tar.gz)
md5sums=('3112357084903d22c39239ae81d78c05')
arch=('i686' 'x86_64')

build() {
	cd $srcdir/$pkgname
	./configure
	make || return 1
	make DESTDIR=$pkgdir install
	chmod -R 755 $pkgdir/usr/share/centbar/plugins
}
