# Maintainer: Duncan K. <duncank@fastmail.fm>

pkgname=kentuckyroutezero-hib
pkgver=0_20140520
_hibver=v11
pkgrel=1
pkgdesc='An adventure game about a secret highway in the caves beneath Kentucky (Humble Bundle version)'
url='http://kentuckyroutezero.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('glu' 'libxcursor' 'alsa-lib')
optdepends=('libpulse: PulseAudio support')
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

if [ $CARCH == i686 ]; then
  _binext='x86'
else
  _binext='x86_64'
fi

_installer="KentuckyRouteZero_Linux_${_hibver}.zip"
source=("hib://${_installer}"
        "kentuckyroutezero-hib.desktop")
md5sums=('0848d0e3c527eec8f78b270e23a0976d'
         '3c5c1dc32f3121c2276fec1ad31e3359')

package() {
  cd $srcdir
  _installdir="/opt/kentuckyroutezero"; _target=$pkgdir/$_installdir

  # Install game files
  mkdir -p $_target
  cp -rT "Linux" $_target

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "Linux/KentuckyRouteZero_Data/Resources/UnityPlayer.png" \
                "${pkgdir}/usr/share/pixmaps/kentuckyroutezero.png"

  # Link executable
  install -d "${pkgdir}/usr/bin"
  ln -s "${_installdir}/KentuckyRouteZero.${_binext}" "${pkgdir}/usr/bin/kentuckyroutezero"
}
