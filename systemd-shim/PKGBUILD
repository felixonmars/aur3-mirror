# Maintainer: Alad Wenter
# base64 -d <<< dGhlLmNoYW5naW5nLnNpZGVAZ21haWwuY29tCg==

pkgname=systemd-shim
pkgver=7_3
pkgrel=1
pkgdesc="shim for systemd"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+source/systemd-shim"
license=('GPL')
depends=('cgmanager')
provides=('systemd=216')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/systemd-shim_${pkgver%%_*}.orig.tar.xz"
	"https://launchpad.net/ubuntu/+archive/primary/+files/systemd-shim_${pkgver//_/-}.debian.tar.xz")
sha256sums=('011adf341dcf44149646cd4aff4e864fce93ef954b6820adda33c6816f8efa8d'
            '9c620bf5fd32aa805c47f76a272f1e4740b86db545cae57df5d52daa1ea7d1db')

prepare() {
	_patchdir="$srcdir/debian/patches"
	cd "$srcdir/$pkgname-${pkgver%%_*}"

	patch -p1 < "$_patchdir/0001-cgmanager-stop-doing-async-calls.patch"
	patch -p1 < "$_patchdir/git-transient_unit_signature.patch"
}
	
build() {
	cd "$srcdir/$pkgname-${pkgver%%_*}"
	aclocal && autoheader && automake --add-missing
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/${pkgname}
	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%%_*}"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/etc/dbus-1/system.d/org.freedesktop.systemd1.conf" \
		"$pkgdir/etc/dbus-1/system.d/org.freedesktop.systemd-shim.conf"
}
