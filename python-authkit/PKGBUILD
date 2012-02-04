pkgname=python-authkit
pkgver=0.4.3
pkgrel=1
pkgdesc="An authentication and authorization toolkit for WSGI applications and frameworks"
arch=(any)
url="http://authkit.org/"
depends=('python>=2.5' 'python-urljr>=1.0.0' 'python-openid>=2.0.1' 'python-beaker>=0.7.3')
source=(http://pypi.python.org/packages/source/A/AuthKit/AuthKit-${pkgver}.tar.gz)
license=('MIT')

build()
{
  cd $startdir/src/AuthKit-$pkgver
  python setup.py install --root=$startdir/pkg
  
  #python 2.6 has elementtree, yadis is in openid and openid is much newer, fix:
  sed -i -e '/elementtree/d' -e '/yadis/d' -e '/openid/d' $pkgdir/usr/lib/python2.6/site-packages/AuthKit-0.4.3-py2.6.egg-info/requires.txt
}

md5sums=('dfbaf2ecc0c682305dd918fbf3c1600e')
