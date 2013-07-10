# Contributor: Richard Macwan <rich4rd.macwan@gmail.com>
pkgname=timelapse-svn
pkgver=0.1.0
pkgrel=1
pkgdesc="Timelapse is used to generate timelapse videos from webcams/long video files"
url="https://code.google.com/p/time-lapse"
arch=('i686' 'x86_64')
license="GPLv3"
depends=('opencv')
makedepends=('svn' 'cmake')
#source=("http://code.google.com/p/time-lapse/source/checkout")
_svntrunk=http://time-lapse.googlecode.com/svn/trunk/
_svnmod=time-lapse
md5sums=()
build() {
  cd "${srcdir}" 
  if [ -d "$_svnmode/.svn" ]; then
   	(cd "$_svnmod" && svn up -r "$pkgver")
  else
   svn co "$_svntrunk" "$_svnmod"
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting make"
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cmake ./ 
  make
}
 
package() {
  cd "${srcdir}/$_svnmod-build"
  make DESTDIR="${pkgdir}" install
}
