# Maintainer: David Runge <david[d]runge[a]frqrec[d]com>
pkgname=systemd-dropbox-daemon
pkgver=0.5
pkgrel=1
pkgdesc="Systemd Dropbox unit file (to setup with user name)"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL3')
depends=(dropbox)
install=$pkgname.install
source=('dropbox@.service')
md5sums=('5b9338b4efc4963818a83d148801f635')

build() {
	install -vDm644 ${srcdir}/dropbox@.service ${pkgdir}/usr/lib/systemd/system/dropbox@.service
}
