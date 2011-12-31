pkgname=python-amazon-product-api-hg
pkgver=337
pkgrel=1
pkgdesc="A Python wrapper for the Amazon Product Advertising API."
arch=('any')
url="http://bitbucket.org/basti/python-amazon-product-api/"
license=('BSD')
depends=('python2')
makedepends=('mercurial')

_hgroot="http://bitbucket.org/basti/"
_hgrepo="python-amazon-product-api"

build() {
  cd $srcdir

  if [ -d $_hgrepo/.hg ]; then
    (cd $_hgrepo && hg up -r $pkgver)
  else
    hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
  fi

  msg 'Mercurial checkout done or server timeout'

  if [ -d $_hgrepo-build ]; then
    msg 'Removing old build directory'
    rm -rf $_hgrepo-build
  fi
  
  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build
  
  msg 'Starting build'
  cd $srcdir/$_hgrepo-build

  msg 'Running setup.py'
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
} 
