# Contributor: xehp < jeff * mcmedia com au >

pkgname=macaddr
pkgver=1.0.0
pkgrel=1
pkgdesc="A daemon script for altering MAC addresses"
arch=(i686 x86_64)
backup=(etc/conf.d/macaddr)
source=("macaddr.conf" "macaddr.rc")
license="GPL"
url="http://aur.archlinux.org/"
md5sums=('94209495ab4716a509b7416eaa6e055d' '2702e2607f1a5635e16ba7553e7a2012')

build() {
	install -m 755 -D ${startdir}/${pkgname}.rc ${startdir}/pkg/etc/rc.d/macaddr
	install -m 644 -D ${startdir}/${pkgname}.conf ${startdir}/pkg/etc/conf.d/macaddr
}

