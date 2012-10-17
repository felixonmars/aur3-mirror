# Maintainer: Frank Vanderham <twelve.eighty (at) gmail.>
# Contributor: Hsin-Yi Chen (hychen) <hycehn (at) canonical.com>
# Contributor: b3niup
# Also see: https://bbs.archlinux.org/viewtopic.php?id=145884
pkgname=wireless-bcm43142-oneiric-dkms
_pkgname=broadcom-wl
pkgver=6.20.55.19
pkgrel=4
pkgdesc="Broadcom 802.11 Linux STA wireless driver BCM43142."
url="https://bbs.archlinux.org/viewtopic.php?id=145884"
arch=('x86_64')
license=('custom')
depends=('linux>=3.6' 'dkms' 'linux-headers')
source=(
	"https://dl.dropbox.com/s/jerkl6uqal5ylv3/wireless-bcm43142-dkms-6.20.55.19_amd64.deb"
	'modprobe.d'
	'dkms-conf.patch'
	'linux-recent.patch'
)
sha1sums=(
	'a03f4e085b487196c736dc8ab853146710c70f49'
	'89bf92286ede30dd85304c6c4e42e89cfdc0f60a'
	'34d94398848d38736840023f015861d5bc65f7b0'
	'4ac81b81482b7d2adb1957c1e69eadca928e3cca'
)

backup=('etc/modprobe.d/broadcom-wl.conf')
install=install

build() {
	cd "${srcdir}"

	# Extract the data payload from the .deb file
	tar -xzvf data.tar.gz

	# some housekeeping, Debian files not used
	rm data.tar.gz
	rm control.tar.gz
	rm debian-binary
	rm -R usr/share/*
	rmdir usr/share

	# Move usr/src/wireless-bcm..../* to ./*
	mv usr/src/wireless-bcm43142-oneiric-dkms-6.20.55.19~bdcom0602.0400.1000.0400/* .
	rm -R usr/*
	rmdir usr/

	# Patching is handled by Arch patch instead of the Debian ones, so remove it
	rm patches/*
	rmdir patches/

	# Apply patches
	patch -p1 -i linux-recent.patch
	patch -p1 -i dkms-conf.patch

}

package() {
	cd "${srcdir}"
	
	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}

	cp -RL * ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	install -D -m 644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 modprobe.d "${pkgdir}"/etc/modprobe.d/broadcom-wl.conf
}
