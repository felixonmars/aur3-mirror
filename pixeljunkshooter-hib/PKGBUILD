# Maintainer: Duncan K. <duncank@fastmail.fm>

pkgname=pixeljunkshooter-hib
pkgver=0_20140702
pkgrel=1
pkgdesc='Fluid action shooter game (Humble Bundle version)'
url='http://pixeljunk.jp/library/Shooter/'
arch=('i686' 'x86_64')
license=('custom:commercial')
if [ $CARCH == i686 ]; then
  depends=('gcc-libs' 'sdl2' 'libxdamage')
  optdepends=('libpulse: PulseAudio support')
else
  depends=('lib32-gcc-libs' 'lib32-sdl2' 'lib32-libxdamage')
  optdepends=('lib32-libpulse: PulseAudio support')
fi
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
_installer='PJShooter_linux.tar.gz'

source=("hib://${_installer}"
        "pjshooter"
        "pjshooter.desktop")
md5sums=('852ca1c395199e7d6e52aa4f028562b6'
         '4b48f4ddb87d30d4f2d0d164d08319ae'
         '15cebdd46594e453815878d231ba21c9')

package() {
  cd $srcdir
  _installdir="/opt/pjshooter"; _target="${pkgdir}/${_installdir}"

  # Install game files
  mkdir -p $_target
  cp -rT "PJShooter" $_target

  # Install desktop entry
  install -Dm644 "pjshooter.desktop" \
                 "${pkgdir}/usr/share/applications/PixelJunk Shooter.desktop"

  # Install icon
  install -Dm644 "PJShooter/resources/icon.bmp" \
                 "${pkgdir}/usr/share/pixmaps/pjshooter.bmp"

  # Install launcher script
  install -d "${pkgdir}/usr/bin"
  cp "pjshooter" "${pkgdir}/usr/bin/pjshooter"
  ln -s "/usr/bin/pjshooter" "${pkgdir}/usr/bin/pixeljunkshooter"
}
