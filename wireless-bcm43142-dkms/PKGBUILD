# Maintainer: Frank Vanderham <twelve.eighty (at) gmail.>
# Contributor: Hsin-Yi Chen (hychen) <hycehn (at) canonical.com>
# Contributor: Alberto Milone <alberto.milone (at) canonical.com>
# Contributor: Jasmine Hassan <jasmine.aura (at) gmail.com>
# Contributor: b3niup
# Upstream code branches: https://code.launchpad.net/ubuntu/+source/bcmwl
# Also see: https://bbs.archlinux.org/viewtopic.php?id=145884
pkgname=wireless-bcm43142-dkms
_pkgname=broadcom-wl
pkgver=6.30.223.30
pkgrel=1
pkgdesc="Broadcom 802.11 Linux STA wireless driver BCM43142."
url="https://bbs.archlinux.org/viewtopic.php?id=145884"
arch=('i686' 'x86_64')
license=('custom')
depends=('dkms' 'linux-headers')
conflicts=('wireless-bcm43142-oneiric-dkms')
source=(
	"https://launchpad.net/ubuntu/+archive/primary/+files/bcmwl_6.30.223.30%2Bbdcom.orig.tar.gz"
	"https://launchpad.net/ubuntu/+archive/primary/+files/bcmwl_6.30.223.30%2Bbdcom-0ubuntu1.diff.gz"
	'wireless-bcm43142-dkms.conf'
	'dkms.conf'
	'001-Arch-Makefile.patch'
	'002-Module-License.patch'
)
sha1sums=(
	'4a7bd82ad263a4cd407b29088a0c9d7cbd4a674b'
	'585347f450da4949e56c1d84adf472451a5f94a3'
	'a37c5dd9ab279372f0c68595bb2a8f1fe694cd13'
	'5a4a8bde48eb6f5b5444ab10cb875a353552a14b'
	'90bc9022532b4769d862dfdca16d1179130111c1'
	'306bccd26b12c808977cacf630860e7d483d213f'
)

backup=('etc/modprobe.d/wireless-bcm43142-dkms.conf')
install=install

build() {
	cd "${srcdir}"

	# apply diff patch to create the debian/ folder
	patch -p1 -i bcmwl_6.30.223.30%2Bbdcom-0ubuntu1.diff

	# apply source patches
	patch -d ./bcmwl-6.30.223.30+bdcom/src -p1 -i ../../debian/patches/0001-MODULE_LICENSE.patch 
	patch -d ./bcmwl-6.30.223.30+bdcom -p1 -i ../debian/patches/0002-Makefile.patch
	patch -d ./bcmwl-6.30.223.30+bdcom/src -p1 -i ../../debian/patches/0003-Make-up-for-missing-init_MUTEX.patch
	patch -d ./bcmwl-6.30.223.30+bdcom/src -p1 -i ../../debian/patches/0006-add-support-for-linux-3.8.0.patch
	patch -d ./bcmwl-6.30.223.30+bdcom/src -p1 -i ../../debian/patches/0007-nl80211-move-scan-API-to-wdev.patch
	patch -d ./bcmwl-6.30.223.30+bdcom/src -p1 -i ../../debian/patches/0008-add-support-for-linux-3.9.0.patch

	# patch to replace use of dkpg with uname to detect 64 vs. 32 bit
	patch -p1 -i 001-Arch-Makefile.patch

	# patch for MODULE_LICENSE
	patch -d ./bcmwl-6.30.223.30+bdcom/src -p1 -i ../../002-Module-License.patch

	# move folders to create Arch specific folder layout
	mv bcmwl-6.30.223.30+bdcom/src/* ./

	# move Makefile to main src/ folder
	mv ./bcmwl-6.30.223.30+bdcom/Makefile ./

	# delete the debian folders and files not needed for packaging
	rm -R debian/
	rm -R bcmwl-6.30.223.30+bdcom/
	rm bcmwl_6.30.223.30%2Bbdcom.orig.tar.gz
	rm bcmwl_6.30.223.30%2Bbdcom-0ubuntu1.diff.gz
	rm bcmwl_6.30.223.30%2Bbdcom-0ubuntu1.diff

}

package() {
	cd "${srcdir}"
	
	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}

	cp -RL * ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	install -D -m 644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 wireless-bcm43142-dkms.conf "${pkgdir}"/etc/modprobe.d/wireless-bcm43142-dkms.conf
}
