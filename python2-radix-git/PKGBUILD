_pkgname=python2-radix
pkgname="${_pkgname}-git"
pkgver=0.5
pkgrel=1
pkgdesc="Radix tree implementation for Python, which supports storage and lookups of IPv4 and IPv6 networks"
arch=('any')
url="http://www.mindrot.org/projects/py-radix/"
license=("LGPL")
depends=('python2>=2.6' 'setuptools')
provides=('python2-radix')
source=("$_pkgname::git+https://github.com/endreszabo/py-radix.git")
md5sums=('SKIP')
license=('BSD')
package() {
  cd $srcdir/$_pkgname
  
  # replace /usr/bin/env python with python2
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;
  
  python2 ./setup.py install --root=$pkgdir --prefix=/usr
}
