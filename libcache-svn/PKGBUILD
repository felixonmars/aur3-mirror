#Maintainer:

pkgname=libcache-svn
pkgver=16
pkgrel=2
pkgdesc="Commandline GCF extractor/tool"
arch=('i686' 'x86_64')
url="http://singul4rity.com"
license=('GPL')
depends=('protobuf' 'boost-libs' 'crypto++')
makedepends=('svn' 'qt4')
provides=('libcache')
conflicts=('libcache')
source=('readme'
        'libcache::svn+https://subversion.assembla.com/svn/libcache/trunk'
        'libnoname::svn+https://subversion.assembla.com/svn/libnoname/trunk')
md5sums=('fad67c4887a0ba404e3e47a33d8883a2'
         'SKIP'
         'SKIP')

_svnmod="libcache"
_svnlibnonamemod="libnoname"

pkgver() {
  cd "${SRCDEST}/${_svnmod}"
  svnversion
}

build() {
  cd "${srcdir}/${_svnlibnonamemod}"

  qmake-qt4
  make

  cd "${srcdir}/${_svnmod}"

  mkdir libnoname
  ln -s "${srcdir}/${_svnlibnonamemod}/noname" libnoname/
  ln -s "${srcdir}/${_svnlibnonamemod}/libnoname.a" .

  echo "LIBS += -lpthread -lz -lboost_system" >> libcache.pro
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${_svnmod}"
  install -Dm755 libcache "${pkgdir}/usr/bin/libcache"
  install -Dm644 "${srcdir}/readme" "${pkgdir}/usr/share/doc/libcache/README"
}