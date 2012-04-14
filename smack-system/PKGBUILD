pkgname=smack-system
pkgver=0.4
pkgrel=2
conflicts=('smack-util')
replaces=('smack-util')
pkgdesc="Main configuration files for smack."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/Blub/libwbsmack"
depends=()
source=(
	etc-rc.d-smack
	etc-conf.d-smack
	smack.service
	smack.mount
	etc-smack-netlabel
	etc-smack-ambient
	etc-smack-accesses
)
backup=(
	etc/conf.d/smack
	etc/smack/netlabel
	etc/smack/ambient
	etc/smack/accesses
)
md5sums=('1c077412d7769fedac397f34918c38fc'
         '4d698dcd462433a9fe67a22ac883ca5c'
         'd2d0df07f797c28c79c552acc1f294d3'
         '082eaefa9a2674d0cde4066b948ecafb'
         '505de7db895a01741c4f0b48e4ae1c3b'
         '92520a5a9cf893220b9cd447f585f144'
         'c1d02f5740a8ba3f6db5dfbbe6585b3e')

install=install

build() {
	:
}

package() {
	install -d -m755 "$pkgdir/etc/smack"
	install -d -m755 "$pkgdir/etc/smack/accesses.d"
	install -D -m644 "$srcdir/etc-smack-netlabel" "$pkgdir/etc/smack/netlabel"
	install -D -m644 "$srcdir/etc-smack-ambient" "$pkgdir/etc/smack/ambient"

	install -D -m755 "$srcdir/etc-rc.d-smack" "$pkgdir/etc/rc.d/smack"
	install -D -m644 "$srcdir/etc-conf.d-smack" "$pkgdir/etc/smack/smack.rc.conf"
	install -D -m644 "$srcdir/smack.service" "$pkgdir/usr/lib/systemd/system/smack.service"
	install -D -m644 "$srcdir/smack.mount" "$pkgdir/usr/lib/systemd/system/smack.mount"
}
