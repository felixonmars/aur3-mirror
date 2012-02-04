# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=colm-svn
pkgver=2387
pkgrel=1
pkgdesc='A programming language designed for the analysis and transformation of computer languages.'
url='http://www.complang.org/colm/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'kelbt' 'ragel')
makedepends=('subversion')

_svntrunk='http://svn.complang.org/colm/trunk/'
_svnmod='colm'

build() {
  if [ -d ${_svnmod} ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} -r ${pkgver} ${_svnmod}
  fi

  msg 'SVN checkout done or server timeout'
  msg 'Starting make...'

  cd colm
  
  ./autogen.sh

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd colm

  make DESTDIR=${pkgdir} install
}
