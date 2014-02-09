# Maintainer: George Gibbs <vash63 at gmail dot com>

pkgname=ds4drv-git
pkgver=0.3.0.r7.g8bdd0ae
pkgrel=1
pkgdesc="Sony DualShock 4 Userspace Driver"
arch=('any')
url="https://github.com/chrippa/ds4drv"
license=('MIT')
depends=('python-setuptools' 'bluez-utils' 'python-evdev' 'python-pyudev')
makedepends=('git')
provides=('ds4drv')
conflicts=('ds4drv')
install=ds4drv.install
source=("${pkgname%}::git+https://github.com/chrippa/ds4drv.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${pkgname}
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' 
}

package() { 
	cd "$srcdir/$pkgname"
	mkdir -pm755 $pkgdir/etc/udev/rules.d
        cp $srcdir/$pkgname/udev/50-ds4drv.rules $pkgdir/etc/udev/rules.d/50-ds4drv.rules
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -pm755 $pkgdir/etc/systemd/system
	cp $srcdir/$pkgname/systemd/ds4drv.service $pkgdir/etc/systemd/system/ds4drv.service
	cp $srcdir/$pkgname/ds4drv.conf $pkgdir/etc/ds4drv.conf
}

# vim: ft=sh syn=sh
