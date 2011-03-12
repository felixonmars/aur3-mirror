# Maintainer: jerryluc havar . novik ta liamg.com>

pkgname=django-messages
pkgver=0.4.4
pkgrel=1
pkgdesc="user-to-user messaging system for Django"
arch=(any)
url="http://code.google.com/p/django-messages/"
license=('BSD')
depends=('python' 'django')
source=(http://django-messages.googlecode.com/files/django-messages-0.4.4.tar.gz)
md5sums=(a0efecfa5b367d370e0fa60e533176d9)


build() {
	
	cd ${srcdir}/${pkgname}-${pkgver}
  
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
