# Maintainer: sylvain alborini sylvain.alborini@gmail.com

pkgname=erawrim-svn
pkgver=33
pkgrel=1
pkgdesc="Action manager for mir:ror"
arch=('any')
url="http://code.google.com/p/erawrim/"
license=('MPL')
depends=('bash')
makedepends=('svn')
source=()
md5sums=()

_svntrunk="http://erawrim.googlecode.com/svn/trunk/"
_svnmod="erawrim-read-only"

#svn checkout http://erawrim.googlecode.com/svn/trunk/ erawrim-read-only

build() {
  cd "$srcdir"
  
  msg "Checking out Source ..."
  if [ -d ${_svnmod}/.svn ]; then
    msg "update"
    (cd ${_svnmod} && svn up )
  else
    msg "checkout"
    svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  msg "Starting make..."
  cd "$_svnmod"
  if test "$CARCH" == x86_64; then
    make 64 || return 1
  else
    make || return 1
  fi
  msg $pkgdir
  mkdir -p ${pkgdir}/usr/bin
  make DISTDIR="${pkgdir}/usr/bin" install || return 1
  

} 

