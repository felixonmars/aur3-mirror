# Maintainer: George Gibbs <vash63 at gmail dot com>

pkgname=ds4drv-git
pkgver=40
pkgrel=2
pkgdesc="Sony DualShock 4 Bluetooth Driver"
arch=('any')
url="https://github.com/chrippa/ds4drv"
license=('MIT')
depends=('python-setuptools' 'bluez-utils' 'python-evdev')
makedepends=('perl' 'git')
install=ds4drv.install
source=("${pkgname%}::git+https://github.com/chrippa/ds4drv.git" 50-uinput.rules)
sha256sums=('SKIP'
            'b67455c70a2559fbb6872949974c79503f9005ec44fd99ea2ca1f8ae47fe4d09')

pkgver() {
	cd "${srcdir}"/${pkgname%-*}
	git rev-list --count HEAD
}

package() { 
	mkdir -pm755 $pkgdir/etc/udev/rules.d
        cp 50-uinput.rules $pkgdir/etc/udev/rules.d/50-uinput.rules
	cd "$srcdir/$pkgname"
	mkdir -pm755 $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
	python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ft=sh syn=sh
