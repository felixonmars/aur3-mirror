# $Id$
# Maintainer: Thomas Martin Klein <kleintamasmarton@gmail.com> (Dino Krtanjek <krtanjekdino@gmail.com>)
pkgname=php-xcache
pkgver=2.0.0
pkgrel=1
pkgdesc="A fast and stable PHP opcode cacher"
arch=('i686' 'x86_64')
url="http://xcache.lighttpd.net/"
license=('BSD')
depends=('php')
install=$pkgname.install
backup=('etc/php/conf.d/xcache.ini')
source=(http://xcache.lighttpd.net/pub/Releases/$pkgver/xcache-$pkgver.tar.gz
		'xcache.ini')
md5sums=('0c903c2eb70e31cbc35ae66fdb750bdc'
		'579d19aaef125c763b0e5b56de8378ed')
_admindir=/srv/http/xcache-admin

build() {
	cd "$srcdir/xcache-$pkgver"
	phpize || return 1
	./configure --prefix=/usr --enable-xcache --enable-xcache-optimizer \
	--enable-xcache-coverager || return 1
	make || return 1
	make INSTALL_ROOT=$pkgdir install || return 1
	echo -e "\n"
	msg "XCache administration panel:"
	echo "
XCache has a admin panel written in php. The administration panel displays
useful information about cached scripts and memory usage. If u choose to
install it, it will be installed in the $_admindir directory. If you keep
your web documents elsewhere, just make a symlink (ln -s) to the $_admindir
directory. You could also copy the content of $_admindir to
the desired location, but then remember to manually copy the content again
on a package update.

NOTE: the administration is protected with a builtin http authentication
that does't always work. If you can't access the admin panel, try to
disable the authentification by setting xcache.admin.enable_auth to Off in
xcache.ini. However, this is not recommended, because then anybody can
access you're XCache admin panel. Try to set up some alternative
authentication approach.
"
	install_admin=""
	while [[ "$install_admin" != "y" && "$install_admin" != "n" ]]; do
		read -p "Include XCache admin panel in the package? [y/n] " -n 1 install_admin
		echo -e "\n"
	done
	if [ "$install_admin" == "y" ]; then
		mkdir -p "$pkgdir$_admindir/"
		install -Dm644 admin/* "$pkgdir$_admindir/"
		msg "The administration will be installed in $_admindir."
	fi
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 $srcdir/xcache.ini "$pkgdir/etc/php/conf.d/xcache.ini"
}

