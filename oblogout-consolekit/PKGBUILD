# Contributor: XaBz <xabz.2k5 gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=oblogout-consolekit
_prgnam=oblogout
pkgver=0.2
pkgrel=3
pkgdesc='Openbox logout script, with consolekit support'
arch=('any')
url='https://launchpad.net/oblogout'
depends=('pygtk' 'cairo' 'python2-pillow' 'python2-distutils-extra'
         'dbus-python' 'upower' 'consolekit')
optdepends=('xlockmore: for locking the screen')
license=('GPL2')
backup=(etc/oblogout.conf)  
conflicts=('openboxlogout-gnome' 'oblogout')
provides=('oblogout')
source=("http://launchpad.net/oblogout/$pkgver/$pkgver.0/+download/$_prgnam-$pkgver.tar.bz2"
	      "$_prgnam.patch"
	      "$_prgnam.conf"
	      'ru.po')
sha256sums=('f80003b85e9f4f1c588675453ea03f40a86fc50546d509ceb69706eb045782a9'
            'cea52a14df0ef924fcdd63b2e82c14b94cc2a7753994c176621ace9502bd9109'
            '5ea0bbb41d223fca7aefb73763ed5a65c01e1a2aebbb929c381b44bcb53b7c48'
            'aa8504055ec1e0661c3588cde85aad3267ffa7a42414c106e6ce8bff71f9d883')

build() {
  cd "$_prgnam"
  patch -p0 -i "$srcdir/$_prgnam.patch"
	sed -i '0,/on/s//on2/' "$_prgnam"/*.py
  cp "$srcdir/ru.po" po
}

package() {
  cd "$_prgnam"
  python2 setup.py install --root="$pkgdir"
  install -m644 "$srcdir/oblogout.conf" "$pkgdir/etc/"
}

# vim:set ts=2 sw=2 et:
