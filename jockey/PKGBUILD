# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Mark Pustjens <pustjens@dds.nl
# Contributor: PirateJonno <j@skurvy.no-ip.org>
# Contributor: mrbit

pkgname=jockey
pkgver=0.9.7
pkgrel=3
pkgdesc="Jockey provides an user interface and desktop integration for installation and upgrade of third-party drivers."
url="http://launchpad.net/jockey"
arch=('any')
license=('GPL')
source=("http://launchpad.net/jockey/trunk/$pkgver/+download/${pkgname}-${pkgver}.tar.gz")
depends=('python2' 'dbus-python' 'python2-xdg' 'polkit' 'packagekit' 'pygtk' 'python2-notify' 'python2-pycurl' 'python2-gobject' 'python2-xkit' 'libappindicator3')
makedepends=('python2-distutils-extra')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
        # python2 fix
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' setup.py
	python2 ./setup.py build --build-base ${srcdir}/build/ || return 1
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	python2 ./setup.py install --prefix=/usr --root=${pkgdir} \
		--install-purelib=/usr/lib/python2.7/site-packages/ \
		--no-compile -O0
}
md5sums=('70b5739a1045140c0faf62b9d2f1f16a')

