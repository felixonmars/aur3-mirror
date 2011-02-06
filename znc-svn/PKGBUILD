# Maintainer: Kin <kurisui at gmail dot com>
pkgname=znc-svn
pkgver=1838
pkgrel=2
pkgdesc='An IRC proxy (bouncer) with modules & scripts support from SVN with Extras enabled'
arch=(i686 x86_64)
url=http://en.znc.in/wiki/index.php/ZNC
license=(GPL)
depends=(gcc-libs perl openssl c-ares tcl)
makedepends=(perl openssl gcc pkgconfig tcl grep)
provides=('znc=0.089')
conflict=(znc)

_svntrunk="https://znc.svn.sourceforge.net/svnroot/znc/trunk"
_svnmod=znc-svn
_cpu=$(cat /proc/cpuinfo | grep processor | wc -l)

build() {


  cd ${srcdir} || return 1

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co -r ${pkgver} ${_svntrunk} ${_svnmod}
  fi

  cd ${_svnmod}

    ./configure --prefix=/usr --enable-extra --enable-tcl || return 1
    make -j${_cpu}|| return 1
    make install DESTDIR=$pkgdir
    cd $pkgdir
    rm -rf $(find . -name .svn) || return 1
}


