# Maintainer: res <andres87p gmail>
pkgname=gccgo-svn
pkgver=155971
pkgrel=1
pkgdesc='Go compiler using the gcc backend'
arch=(i686 x86_64)
url=http://golang.org/
license=(GPL)
makedepends=(subversion)
optdepends=(gold-cvs)

_svnmod=${pkgname%-svn}
_svntrunk=svn://gcc.gnu.org/svn/gcc/branches/$_svnmod

build() {
  if [[ -d $_svnmod/.svn ]]; then
    (cd $_svnmod; svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir . -r $pkgver $_svnmod
  fi

  msg 'SVN checkout done or server timeout'
  msg 'Starting make...'

  rm -rf build
  mkdir build
  cd build

  ../$_svnmod/configure --enable-languages=c,c++,go \
                        --mandir=/usr/share/man \
                        --prefix=/usr \
                        --infodir=/usr/share/info #\
                       #--with-ld=/usr/bin/gold
  make || return 1
  make DESTDIR=$pkgdir install
}
