# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Lukas Knappstein <knappsteinl@gmx.de>
pkgname=ytmp3
pkgver=1.0
pkgrel=1
pkgdesc="Youtube to mp3 converter with automatic optimal sound-quality based on ffmpeg and youtube-dl"
arch=(i686 x86_64)
license=('GPL')
depends=('ffmpeg' 'youtube-dl')
source="youtube_mp3"
url=http://www.this_is_not_needed_by_my_programm_cause_its_only_a_small_script
md5sums=('0c7612ea4b57ece389045c193913bdfc')

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp youtube_mp3 $pkgdir/usr/bin/ytmp3
} 
