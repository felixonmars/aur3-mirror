# Maintainer: Tim Gerhard <tim-gerhard@schnellbach-beltheim.de>
pkgname=dropboxd-userspace
pkgver=0.5
pkgrel=3
depends=('bash' 'dropbox')
pkgdesc="start dropboxd as a real daemon, running as a specified user."
arch=('any')
url="http://dl.dropbox.com/u/8192972/arch_pacs/dropboxd-userspace.html"
license=('custom')
install="install"
source=(dropboxd-userspace dropboxd-userspace.conf)
md5sums=(224667836878f263f9575c11d64d0cf3 2aa3b6bcc8cc86deacde148da90fd2a6)

build() {
	cd $srcdir
	mkdir -p ${pkgdir}/etc/rc.d/
	mkdir -p ${pkgdir}/etc/conf.d/
	install -m644 dropboxd-userspace.conf ${pkgdir}/etc/conf.d/
	install -m755 dropboxd-userspace ${pkgdir}/etc/rc.d/
}
