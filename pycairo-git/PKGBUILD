# Maintainer: dx <dx@dxzone.com.ar>

pkgname=pycairo-git
pkgver=20110718
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
depends=('python2' 'cairo')
options=('!libtool')
url="http://www.cairographics.org/"
provides=('python2-cairo')
makedepends=('git')
conflicts=('pycairo')
_gitroot='git://git.cairographics.org/git/'
_gitname='py2cairo'

build() {
  export PYTHON=/usr/bin/python2

  if [ -d ${srcdir}/$_gitname ]; then
    cd $srcdir/$_gitname
    git pull
  else
    cd $srcdir
    git clone $_gitroot$_gitname
    cd $_gitname
  fi

  cd "${srcdir}/$_gitname"
  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
