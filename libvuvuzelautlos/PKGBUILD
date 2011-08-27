# Maintainer: Alexander Straube <Alexander.Straube@GoogleMail.com>
pkgname=libvuvuzelautlos
pkgver=20100619
pkgrel=1
pkgdesc="VLC plugin that suppresses the disturbing Vuvuzela noise during soccer matches"
arch=('i686' 'x86_64')
url="http://www.ind.rwth-aachen.de/en/research/tools/vuvuzelautlos"
license=('GPL')
depends=("vlc")

if [ "$CARCH" == "i686" ]; then
  source=("http://www.ind.rwth-aachen.de/fileadmin/user_upload/${pkgname}_x32_plugin.so")
  md5sums=('e2d84648a29959aa8a2ba57afda8722d')
elif [ "$CARCH" == "x86_64" ]; then
  source=("http://www.ind.rwth-aachen.de/fileadmin/user_upload/libvuvuzelautlos_x64_plugin.so")
  md5sums=('4bbb76ad81de4637f1c7af497189e272')
else
  return 1
fi

build(){
  /bin/true
}

package() {
  cd "$srcdir"
  
  if [ "$CARCH" == "i686" ]; then
    install -D -m 0755 ${pkgname}_x32_plugin.so ${pkgdir}/usr/lib/vlc/audio_filter/${pkgname}_x32_plugin.so
  elif [ "$CARCH" == "x86_64" ]; then
    install -D -m 0755 ${pkgname}_x32_plugin.so ${pkgdir}/usr/lib64/vlc/audio_filter/${pkgname}_x64_plugin.so
  else
    return 1
  fi
}

# vim:set ts=2 sw=2 et:
