pkgname=python-xattr
pkgver=20111028
pkgrel=1
pkgdesc="module for manipulating filesystem extended attributes"
arch=('i686' 'x86_64')
url="http://undefined.org/python/#xattr"
license=('MIT')
conflicts=('pyattr')
provied=('pyattr')
makedepends=('setuptools')
depends=('python2')

_gitroot=https://github.com/xattr/xattr.git
_gitname=xattr

build() {
  cd $srcdir/

  if [ -e ${_gitname} ] ; then
    cd ${_gitname}
    git pull
    cd ..
  else
    git clone ${_gitroot} ${_gitname}
  fi

  cd $srcdir/xattr/
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
