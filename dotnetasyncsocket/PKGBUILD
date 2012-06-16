pkgname=dotnetasyncsocket
pkgver=14
pkgrel=1
pkgdesc="TCP/IP socket networking library for .Net. It's fully asynchronous, with complete delegate support."
arch=(any)
license=("MIT")
depends=(mono)
makedepends=(mono subversion)
options=(!strip)
url="http://code.google.com/p/dotnetasyncsocket/"
_svntrunk="http://dotnetasyncsocket.googlecode.com/svn/trunk/"
_svnmod="dotnetasyncsocket"

build() {
  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg 'SVN checkout done or server timeout'

  rm -rf "${_svnmod}-build"
  cp -r "$_svnmod" "${_svnmod}-build"
  cd "${_svnmod}-build"
  
  xbuild AsyncSocket.sln
  cd "AsyncSocket/bin/Debug"
  monodis Deusty.Net.dll --output=Deusty.Net.il
  sn -k 1024 AsyncSocket.snk
  ilasm /dll /key:AsyncSocket.snk Deusty.Net.il
}

package() {
  cd "${srcdir}/${_svnmod}-build/AsyncSocket/bin/Debug"
  
  install -Dm644 "Deusty.Net.dll" "$pkgdir/usr/lib/dotnetasyncsocket/Deusty.Net.dll"
  install -m644 "Deusty.Net.dll.mdb" "$pkgdir/usr/lib/dotnetasyncsocket/Deusty.Net.dll.mdb"
  gacutil -i Deusty.Net.dll -root "$pkgdir/usr/lib"
}
