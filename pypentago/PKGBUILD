# Contributor: Florian Mayer <flormayer AT aNOSPAMim DOT com>
pkgname=pypentago
pkgver=0.1.0
pkgrel=6
pkgdesc="pypentago is a free implementation of the boardgame Pentago."
url="http://bitbucket.org/segfaulthunter/pypentago-mainline/"
license=("GPL3")
arch=("any")
depends=('python>=2.6' 'pyqt' 'twisted' 'python-sqlalchemy' 'setuptools')
source=(http://bitbucket.org/segfaulthunter/pypentago-mainline/downloads/pypentago-$pkgver.tar.bz2)

md5sums=('929dc092c9f3e08eb29b4d5894396d02')

options=(!strip)

build() 
{
  cd "${srcdir}/$pkgname-$pkgver"
  
  PYTHONPATH=$PYTHONPATH:$pkgdir/usr/lib/python2.6/site-packages/
  export PYTHONPATH
  mkdir -p $pkgdir/usr/lib/python2.6/site-packages/
  python setup.py install --prefix=$startdir/pkg/usr
  rm -f $pkgdir/usr/lib/python2.6/site-packages/easy-install.pth
  rm -f $pkgdir/usr/lib/python2.6/site-packages/site.py
  rm -f $pkgdir/usr/lib/python2.6/site-packages/site.pyc
}
# vim:syntax=sh
