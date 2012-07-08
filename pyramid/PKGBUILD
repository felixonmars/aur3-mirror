#Maintainer: Damien Churchill <damoxc@gmail.com>
pkgname=pyramid
pkgver=1.3.2
pkgrel=1
pkgdesc='Pyramid is a small, fast, down-to-earth, open source Python web development framework'
arch=('any')
url='http://pylonshq.com/'
license=('custom:BSD')
depends=('python2'
		 'python-mako>=0.3.4'
		 'python-paste>=1.7.2'
		 'python-paste-deploy>=1.3.3'
		 'python-paste-script>=1.7.3'
		 'python2-webob>=0.9.6.1'
		 'python2-repoze.lru'
		 'python2-zope-component'
		 'python2-zope-configuration'
		 'python2-zope-deprecation'
		 'python2-zope-event'
		 'python2-zope-interface'
		 'python2-zope-i18nmessageid'
		 'python2-zope-schema'
		 'python2-venusian'
		 'python2-translationstring')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/p/pyramid/pyramid-${pkgver}.tar.gz)
md5sums=('2462c74563b356d22d654a71ba507c63')

build() {
  cd $srcdir/pyramid-${pkgver}
  python2 setup.py install --root=$pkgdir/ --optimize=1
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $pkgdir -name '*.py')
}
