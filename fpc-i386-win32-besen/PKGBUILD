pkgname=fpc-i386-win32-besen
pkgver=12
pkgrel=3
pkgdesc="Complete ECMAScript Fifth Edition Implemention in Object Pascal (i386-win32)"
arch=(any)
license=("LGPL")
depends=("fpc-i386-win32-rtl>=2.6.0")
makedepends=(ppcross386 subversion mingw-w64-binutils)
options=(!strip)
url="http://code.google.com/p/besen"
_svntrunk="http://besen.googlecode.com/svn/trunk/"
_svnmod="besen"
_unittgt=i386-win32
_fpcver=`fpc -iV`

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
  cd "${_svnmod}-build/src"
  
  ppcross386 -Twin32 BESEN.pas
  ppcross386 -Twin32 BESEN.pas
  ppcross386 -Twin32 BESEN.pas
  ppcross386 -Twin32 BESEN.pas
  ppcross386 -Twin32 BESEN.pas
}

package() {
  cd "${_svnmod}-build/src"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a' -o -name '*.compiled' |
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/besen/"{}
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 i686-w64-mingw32-strip -g
}
