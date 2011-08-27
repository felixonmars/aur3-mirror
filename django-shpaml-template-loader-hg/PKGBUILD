# -*- shell-script -*-

python=python2
name=django-shpaml-template-loader

pkgname=$name-hg
pkgver=5
pkgrel=1
pkgdesc="Load shpaml (haml-like html alternative) templates in django seamlessly."
arch=(any)
url="http://bitbucket.org/jiaaro/$name"
license=('GPL3')
depends=('django')
makedepends=('mercurial' 'setuptools')

_hgroot="http://bitbucket.org/jiaaro"
_hgrepo=$name

build() {
  cd $srcdir/$name
  $python setup.py install --prefix=/usr --root=$pkgdir
}
