# Contributor: M.Hashem < m.hashem@jabber.org > 
pkgname=hijra
pkgver=0.2.1
pkgrel=1
arch=('any')
pkgdesc="A Hijri calendar"
license=('waqf')
url="http://ojuba.org/"
depends=('python2' 'pygtk')
source=(http://dl.dropbox.com/u/7937029/${pkgname}-${pkgver}.tar.gz)
md5sums=('0115c303413d86e1fc5e81f2f2edc19d')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 setup.py install --root=$pkgdir/ --optimize=1

}
