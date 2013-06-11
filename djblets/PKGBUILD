# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasia@siasia>
pkgname=djblets  
pkgver=0.7.15
_pkgver=0.7
pkgrel=1
pkgdesc="Useful utility functions and classes for use with Django"
url="http://code.google.com/p/reviewboard/wiki/Djblets"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-distribute' 'django-pipeline' 'python2-django')
source=(http://downloads.reviewboard.org/releases/Djblets/${_pkgver}/Djblets-${pkgver}.tar.gz env.patch)
md5sums=('b3ef8ea8f87304b3c3c8121fd44ab774'
         '9740252621bc4fe99b87e2e90e491299')

build() {
	cd ${srcdir}/Djblets-$pkgver
	patch -p1 < ${srcdir}/env.patch
	python2 setup.py install --root=${pkgdir} --optimize=1
	rm ${pkgdir}/usr/lib/python2.7/site-packages/tests/*
}
