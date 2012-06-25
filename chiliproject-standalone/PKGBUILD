pkgname=chiliproject-standalone
pkgver=3.2.2
pkgrel=1
pkgdesc="Initscripts and user/group for a standalone Chiliproject setup"
arch=('any')
url="https://www.chiliproject.org"
license=('GPL2')
depends=('chiliproject')
provides=('chiliproject-standalone')
makedepends=('glibc')
options=()
install=chiliproject.install
source=("chiliproject.rc"
        "chiliproject.service")
md5sums=('0f4ea8107519db36d5d949dae27439ed'
         '031567bdc5826ce1823f3f5ccb361398')

build() {
	return 0
}

package() {
	# create /etc/rc.d/chiliproject
	mkdir -p "$pkgdir/etc/rc.d/"
	install -m 755 "$srcdir/chiliproject.rc" "$pkgdir/etc/rc.d/chiliproject"

	# Create systemd service
	mkdir -p "$pkgdir/lib/systemd/system/"
	install -m 644 "$srcdir/chiliproject.service" "$pkgdir/lib/systemd/system/"
}

# vim:set ts=4 sw=4 et:
