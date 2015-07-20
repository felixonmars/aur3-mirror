# Contributer: giacomogiorgianni@gmail.com

pkgname=youtubetomp3
name=YouTubeToMP3
pkgver=3.8
pkgrel=1
pkgdesc="a applications dedicated to playback, download and convert videos from YouTube"
arch=('i686' 'x86_64')
url="http://www.mediahuman.com/"
license=('GPL')
depends=('qt4' 'taglib' 'ffmpeg')
install="$pkgname.install"
#makedepends=('')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('d8262f2991b49f09dcfa2752426fca0a')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386' 
    md5sums=('bdbc90019f474eb4e62f384f465577b3')
fi
source=("http://www.mediahuman.com/files/${name}.$ARCH.deb")
       
build() {
  cd ${startdir}/src
  tar -zxf ${startdir}/src/data.tar.gz
}
  
package() {  
  #sed -i '2s|Mp3|MP3|g' "$srcdir/usr/share/applications/youtube-to-mp3.desktop"
  sed -i '9s|Network|Application;Network|g' "$srcdir/usr/share/applications/youtube-to-mp3.desktop"
  sed -i '4s|Saves aoudio track from YouTube|Pulls audio tracks from YouTube videos|g' "$srcdir/usr/share/applications/youtube-to-mp3.desktop"
  cp -rp usr $pkgdir
  
}
