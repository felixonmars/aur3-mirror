# Maintainer: jwwolf <jwwolf+arch.@gmail.com>
arch=('i686' 'x86_64')
pkgname=mutagen-svn
pkgver=84
pkgrel=1
pkgdesc="An audio metadata tag reader and writer implemented in pure Python"
url="http://code.google.com/p/mutagen/"
license="GPL2"
depends=('python')
makedepends=('subversion')
conflicts=('mutagen')
provides=('mutagen')
source=()
md5sums=()

_svntrunk=http://mutagen.googlecode.com/svn/trunk
_svnmod=mutagen

build() {
  cd $startdir/src
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  cd $_svnmod
  sed -i "s|share/man/|man/|g" setup.py
  python setup.py install --root=$startdir/pkg

  mkdir -p $startdir/pkg/usr/bin
  install -m755 tools/* $startdir/pkg/usr/bin
}
