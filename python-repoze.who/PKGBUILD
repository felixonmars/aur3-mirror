# contributor: DasIch <dasdasich@googlemail.com>

_name=repoze.who
pkgname=python-$_name
pkgver=2.2
pkgrel=1
pkgdesc="WSGI Authentication Middleware"
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://www.repoze.org"
depends=('python' 'python-paste' 'zope-interface')
makedepends=('python-setuptools')
source=(https://github.com/repoze/repoze.who/archive/$pkgver.tar.gz)
md5sums=('3cdeff7dac1de125bf08ee22b6ee3e80')


package() {
	cd "${srcdir}/${_name}-${pkgver}"

	python setup.py install --root="${pkgdir}" --prefix=/usr
}
