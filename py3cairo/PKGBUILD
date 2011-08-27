# Maintainer: myswiat <my.swiat@o2.pl>

pkgname=py3cairo
pkgver=20110705
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
depends=('python' 'cairo')
options=('!libtool')
url="http://www.cairographics.org/"
provides=('pygobject-git-mys')
makedepends=('git')
conflicts=('pycairo-git' 'python2-cairo')
_gitroot='git://git.cairographics.org/git/'
_gitname='pycairo'

build() {
  export PYTHON=/usr/bin/python

  if [ -d ${srcdir}/$_gitname ]; then
    cd $srcdir/$_gitname
    git pull
  else
    cd $srcdir
    git clone $_gitroot$_gitname
    cd $_gitname
  fi

  cd "${srcdir}/$_gitname"
  python3 ./waf configure --prefix=/usr
  python3 ./waf build
  python3 ./waf install
}
