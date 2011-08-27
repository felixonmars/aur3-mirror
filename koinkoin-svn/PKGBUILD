pkgname=koinkoin-svn
pkgver=589
pkgrel=1
pkgdesc="\_o< coin coin!"
arch=(i686 x86_64)
url="http://tifauv.homeip.net/koinkoin/index.html"
license=('LGPL')
depends=('qt' 'kdelibs')
optdepends=('kdebase-workspace')
makedepends=('cmake>=2.4' 'automoc4' 'subversion' 'kdebase-workspace')
provides=('koinkoin')
conflicts=('koinkoin')
source=()
md5sums=()

_svntrunk="https://tifauv.homeip.net/svn/koinkoin/trunk/koinkoin"
_svnmod="koinkoin"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DENABLE_ARGB=ON \
        -DCMAKE_BUILD_TYPE=Release || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
