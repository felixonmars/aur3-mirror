# slackware-pkgtools: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

distname=slackware
realname=pkgtools
pkgname=${distname}-${realname}
pkgver=13.1
pkgverrel=64.1
pkgrel=1
pkgdesc="The Slackware package maintenance system.  Don't confuse it with Arch's '${realname}'."
arch=("any")
url="http://packages.zenwalk.org/?q=pkgtools&zversion=current"
license=("GPL")
depends=("tar")
options=(!emptydirs)

source=(ftp://ftp.sh.cvut.cz/MIRRORS/zenwalk/i486/snapshot/ap/${realname}-${pkgver}-noarch-${pkgverrel}.tgz)
md5sums=('772c35388c6058dff15b05f38ebce6aa')

build() {
	cd ${srcdir}

	# Rename
	mv sbin/explodepkg sbin/${distname}-explodepkg
	mv sbin/installpkg sbin/${distname}-installpkg
	mv sbin/makebootdisk sbin/${distname}-makebootdisk
	mv sbin/makepkg sbin/${distname}-makepkg
	mv sbin/pkgtool sbin/${distname}-pkgtool
	mv sbin/removepkg sbin/${distname}-removepkg
	mv sbin/upgradepkg sbin/${distname}-upgradepkg

	# Directories
	install -d ${pkgdir}/usr/sbin/

	# Install
	install -D sbin/* ${pkgdir}/usr/sbin/
}
