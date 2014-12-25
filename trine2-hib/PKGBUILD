# Maintainer: Sam S. <smls75@gmail.com>

pkgname=trine2-hib
pkgver=2.01+h20141016
_buildver=v2_01_build_425
pkgrel=1
pkgdesc='Trine 2: Complete Story - a fantasy action-puzzle platformer (Humble Bundle version)'
url='http://www.trine2.com/'
arch=('i686' 'x86_64')
license=('custom: commercial')
if [ "$CARCH" == 'i686' ]; then
  depends=('glu' 'nvidia-cg-toolkit' 'gtk2' 'libpng12'
           'openal' 'alsa-lib' 'libogg'  'libvorbis' 'xorg-xwininfo')
else
  depends=('lib32-glu' 'lib32-nvidia-cg-toolkit' 'lib32-gtk2' 'lib32-libpng12'
           'lib32-openal' 'lib32-alsa-lib' 'lib32-libogg' 'lib32-libvorbis'
           'xorg-xwininfo')
fi
conflicts=('trine2')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_archive="trine2_complete_story_${_buildver}_humble_linux_full.zip"
source=("hib://${_archive}"
        "$pkgname.launcher"
        "$pkgname.desktop")
md5sums=('82049b65c1bce6841335935bc05139c8'
         '5a8ddd7d99b7d90633d3996488738d7a'
         '80509ff6b10602acb2beeaa41a4847ec')

noextract=("${_archive}")
prepare() {
    msg2 "Extracting ${_archive}..."
    rm -rf trine2; mkdir trine2; cd trine2
    bsdtar -xf ../"${_archive}"
}

package() {
  _target=/opt/Trine2
  
  # Install game files
  mkdir -p "$pkgdir"/$_target
  cp -TRl trine2 "$pkgdir"/$_target
  
  # Fix permissions
  chmod 755 "$pkgdir"/$_target/bin/trine2_linux_launcher_32bit
  chmod 755 "$pkgdir"/$_target/bin/trine2_linux_32bit
#   trine2_bin_starter.sh
  
  # Remove unneeded files
  rm "$pkgdir"/$_target/lib/lib32/libCg*
  
  # Install icon & desktop entry
  install -Dm644 trine2/trine2.png \
                 "$pkgdir"/usr/share/pixmaps/trine2.png
  install -Dm644 $pkgname.desktop \
                 "$pkgdir"/usr/share/applications/$pkgname.desktop
  
  # Install launch script
  install -Dm755 $pkgname.launcher "$pkgdir"/usr/bin/trine2
  sed -i -e "s|__INSTALLDIR__|$_target|g" "$pkgdir"/usr/bin/trine2
}
