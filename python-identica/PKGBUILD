# Contributor: Ali Gündüz <gndz.ali@gmail.com>
pkgname=python-identica
pkgver=0.6
pkgrel=2
pkgdesc="an ugly hack to use python-twitter lib for identi.ca. just use the same twitter functions and they will be sent to identi.ca/api instead of twitter.com"
arch=(any)
url="http://code.google.com/p/python-twitter/"
license=('APACHE')
depends=('python>=2.5' 'python-simplejson')
conflicts=('python-twitter')
source=(http://python-twitter.googlecode.com/files/python-twitter-${pkgver}.tar.gz)
md5sums=('e1f5c50c60c74944d29ce28178972b95')

build() {
  cd ${srcdir}/python-twitter-${pkgver}

  sed -i 's,/twitter.com,/identi.ca/api,' twitter.py

  # Fix permissions on egg-info files.
  chmod go+r python_twitter.egg-info/*

  python setup.py build || return 1
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
