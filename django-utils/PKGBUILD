# Maintainer: Rudolf Olah <omouse@gmail.com>
# Date: 24 July 2007

pkgname=django-utils
pkgver=0.01
pkgrel=1
pkgdesc="Useful utilities and tools for Django."
url="http://code.google.com/p/django-utils/"
license="New BSD"
depends=('python' 'django-svn')
source=(http://django-utils.googlecode.com/files/$pkgname-v$pkgver.zip)
arch=('i686')

md5sums=('042c8f5a78a8f6f1f5c7bc9af0f79360')

build () {
  mkdir -p $startdir/pkg/usr/lib/python2.5/site-packages
  cp -R $startdir/src/nesh $startdir/pkg/usr/lib/python2.5/site-packages
}