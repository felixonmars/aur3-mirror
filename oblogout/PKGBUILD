# Maintainer: XaBz <xabz.2k5 gmail.com>
pkgname=oblogout
pkgver=0.2
pkgrel=7
pkgdesc="Openbox Logout Script 0.2"
arch=('i686' 'x86_64')
url="https://launchpad.net/oblogout"
depends=('python2' 'pygtk' 'cairo' 'python-imaging' 'python-distutils-extra' 'dbus-python' 'consolekit' 'upower')
license=('GPL2')
backup=(etc/oblogout.conf)  
conflicts=('openboxlogout-gnome')
source=(http://launchpad.net/oblogout/$pkgver/0.2.0/+download/$pkgname-$pkgver.tar.bz2
	'patch' 'oblogout.conf' 'oblogout.install' 'ru.po')
md5sums=('b74398625b1e0a7fcde8f6846f9c6d41'
         '5252ee81f7e6db424b8445072a63d033'
         'f71ed5724f48e804a83e3b3268017328'
         '23b5c71dd6cf8da97a5020ab409c790f'
         'b9e3384efd8d9248a7095d752e87c55c')

build() {
  cp ru.po "$srcdir"/$pkgname/po/
  cd "$srcdir"/$pkgname
  patch -p0 < "$srcdir"/patch
  python2 setup.py install --root="$pkgdir"/
  install -m644 "$srcdir"/oblogout.conf "$pkgdir"/etc/
}