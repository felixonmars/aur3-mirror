# Contributor: Prurigro
# Maintainer: Prurigro, André Klitzing <aklitzing () gmail () com>
pkgname=review-board
pkgver=2.0.11
_pkgver=2.0
pkgrel=1
pkgdesc="Powerful web-based code review tool that offers developers an easy way to handle code reviews."
arch=('any')
license=('MIT')
depends=('python2' 'python2-django' 'python2-django-evolution' 'python2-django-djblets' 'python2-django-pipeline' 'python2-docutils' 'python2-markdown' 'python2-mimeparse' 'python2-paramiko' 'python2-pygments' 'python2-dateutil' 'python2-memcached' 'python2-pytz' 'python2-recaptcha-client')
makedepends=('python2-distribute' 'python2-jsmin')
url="http://www.reviewboard.org/"
source=(http://downloads.reviewboard.org/releases/ReviewBoard/${_pkgver}/ReviewBoard-$pkgver.tar.gz env.patch)
sha256sums=('b94a7ba566791c5c55961bb7b3c7b9ac3e3431a84ee881ad19bd791c4c4bb3ae'
            'e01cec9370f16bf295f1ae9d8c1d094274ce6e948bfa799943897b03182e7d82')

prepare() {
	cd ${srcdir}/ReviewBoard-$pkgver
	patch -p1 < $srcdir/env.patch
}

package() {
	cd ${srcdir}/ReviewBoard-$pkgver
	python2 setup.py install --root=${pkgdir} --optimize=1
}
