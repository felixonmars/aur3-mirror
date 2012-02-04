# slackware-pkgtools: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

pkgname=requiredbuilder
pkgver=0.16.4
pkgverrel=64.1
pkgrel=1
pkgdesc="Simple tool to help Slackware packages developers finding dependencies"
arch=("any")
url="http://packages.zenwalk.org/?q=require&zversion=snapshot"
license=("GPL")
depends=("perl")
options=(!emptydirs)

source=(ftp://ftp.sh.cvut.cz/MIRRORS/zenwalk/i486/snapshot/ap/${pkgname}-${pkgver}-noarch-${pkgverrel}.txz)
md5sums=('59e3b17e169967bad1d8b1d7d72146e1')

build() {
	cd ${srcdir}

	# Directories
	install -d ${pkgdir}/usr/bin/
	install -d ${pkgdir}/usr/share/man/man1

	# Install
	install -D usr/bin/* ${pkgdir}/usr/bin/
	install -D usr/man/man1/requiredbuilder.1.gz ${pkgdir}/usr/share/man/man1
}
