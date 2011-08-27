# Maintainer: twa022 <twa022 at gmail dot com>

# Based on package dropboxd-userspace from
# Tim Gerhard <tim-gerhard@schnellbach-beltheim.de>
pkgname=zeitgeist-userspace
pkgver=0.1
pkgrel=1
depends=('bash' 'zeitgeist')
pkgdesc="start zeitgeist as a real daemon, running as a specified user."
arch=('any')
url="http://zeitgeist-project.com/"
license=('custom')
install="install"
source=(zeitgeist-userspace zeitgeist-userspace.conf)

build() {
	cd $srcdir
	mkdir -p ${pkgdir}/etc/rc.d/
	mkdir -p ${pkgdir}/etc/conf.d/
	install -m644 zeitgeist-userspace.conf ${pkgdir}/etc/conf.d/
	install -m755 zeitgeist-userspace ${pkgdir}/etc/rc.d/
}

md5sums=('942a66199b31d2f2d9d1acd197193172'
         'fc256d61bb3cc5794af183a0c7b7633c')
