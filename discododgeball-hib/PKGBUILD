# Maintainer: Duncan K. <duncank@fastmail.fm>

pkgname=discododgeball-hib
pkgver=0_20140607
pkgrel=1
pkgdesc='Robot Roller-Derby Disco Dodgeball, a team-based multiplayer FPS (Humble Bundle version)'
url='http://www.82apps.com/DiscoDodgeball/'
arch=('i686' 'x86_64')
license=('custom:commercial')
if [ $CARCH == i686 ]; then
  depends=('glu' 'libxcursor' 'alsa-lib')
  optdepends=('libpulse: PulseAudio support')
else
  depends=('lib32-glu' 'lib32-libxcursor' 'lib32-alsa-lib')
  optdepends=('lib32-libpulse: PulseAudio support')
fi
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="DiscoDodgeballm9.zip"
source=("hib://${_installer}"
        "discododgeball-hib.desktop")
md5sums=('1ab97a17c1432c4a969cbbcd6d3131d8'
         'fd48093923124aaec390a7d89f40b4ef')

package() {
  cd $srcdir
  _installdir="/opt/discododgeball"; _target="${pkgdir}/${_installdir}"

  # Fix execute permission
  chmod a+x "Disco Dodgeball/Disco Dodgeball.x86"

  # Install game files
  mkdir -p $_target
  cp -rT "Disco Dodgeball" $_target

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "Disco Dodgeball/Disco Dodgeball_Data/Resources/UnityPlayer.png" \
                 "${pkgdir}/usr/share/pixmaps/discododgeball.png"

  # Link executable
  install -d "${pkgdir}/usr/bin"
  ln -s "${_installdir}/Disco Dodgeball.x86" "${pkgdir}/usr/bin/discododgeball"
}
