pkgname=thrift-svn
pkgver=1241199
pkgrel=1
pkgdesc="Scalable cross-language services framework for IPC/RPC between C++, Java, Ruby, PHP, Python, C, Haskell, Erlang, etc."
arch=(i686 x86_64)
url="http://wiki.apache.org/thrift/"
license=('apache')
depends=(boost flex bison)
makedepends=(git autoconf automake pkg-config)
source=()
md5sums=()

_svntrunk="http://svn.apache.org/repos/asf/thrift/trunk"
_svnmod="thrift"

build(){
  cd ${startdir}/src

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi


  msg "Starting make..."

  cd ${startdir}/src/${_svnmod}
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
  make DESTDIR=${startdir}/pkg install
}
