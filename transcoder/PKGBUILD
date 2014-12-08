# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=transcoder
pkgver=0.0.6
pkgrel=4
pkgdesc="Video converter for Linux using GTK+ and ffmpeg."
arch=('i686' 'x86_64')
url="http://transcoder84.sourceforge.net/"
license=('GPL3')
depends=('gtk2')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://ufpr.dl.sourceforge.net/project/transcoder84/0.0.6/transcoder_0.0.6_amd64.deb)
  md5sums=('1edc7ad47918c4cda0d3e83d9933e47e')
elif  [ "${CARCH}" = 'i686' ]; then 
  source=(http://ufpr.dl.sourceforge.net/project/transcoder84/0.0.6/transcoder_0.0.6_i386.deb)
  md5sums=('c99a0e348c4038c2614cee721f142c23')
fi

package() {

# This (old) program was made using ffmpeg 0.8.
# Due to the fact that ffmpeg has changed API's since version 0.11, it's impossible to compile this program in Arch anymore.
# The best solution(hack) at the moment is using Transcoder with all (transcoding)libraries inside the package compiled with ffmpeg 0.8.

   # Extract .deb
   bsdtar xf $pkgname*
   bsdtar xf data.tar.gz -C $pkgdir
   
   rm -rf $pkgdir/usr/share/doc
}