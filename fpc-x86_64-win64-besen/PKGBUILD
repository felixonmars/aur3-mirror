pkgname=fpc-x86_64-win64-besen
pkgver=12
pkgrel=3
pkgdesc="Complete ECMAScript Fifth Edition Implemention in Object Pascal (x86_64-win64)"
arch=(any)
license=("LGPL")
depends=("fpc-x86_64-win64-rtl>=2.6.0")
makedepends=(fpc subversion mingw-w64-binutils)
options=(!strip)
url="http://code.google.com/p/besen"
_svntrunk="http://besen.googlecode.com/svn/trunk/"
_svnmod="besen"
_unittgt=x86_64-win64
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
  
  fpc -Twin64 BESEN.pas
  fpc -Twin64 BESEN.pas
  fpc -Twin64 BESEN.pas
  fpc -Twin64 BESEN.pas
  fpc -Twin64 BESEN.pas
}

package() {
  cd "${_svnmod}-build/src"
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a' -o -name '*.compiled' |
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/besen/"{}
  find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}
