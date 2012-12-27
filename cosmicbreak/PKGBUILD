# Maintainer: Perberos <perberos@gmail.com>
pkgname=cosmicbreak
pkgver=0.134.0
pkgrel=20121227
pkgdesc="CosmicBreak is an MMO third person shooter featuring massive PvP battles of up to 30 vs. 30 players at one time. Familiar WASD control and fast-paced Arena action makes CosmicBreak quick and easy to get into for any gamer."
arch=('any')
url="http://www.cosmicbreak.com/"
license=('custom:eula')
depends=('wine' 'icoutils')
makedepends=('cabextract')
source=(cosmicbreak.desktop
    cosmicbreak.sh)
md5sums=('8bef55b96971572b79cd410deb3c7eb2'
         'f0dda822c63df97c32d7a7510fffe4ff')

install=cosmicbreak.install
_fileinstaller="CosmicBreakSetup_eng.exe"

package() {

  # hago esto para que en caso de que actualicen el ejecutable, no tire error
  # de md5sum
  # yes, very evil
  wget -c http://download.getamped.com/CosmicBreakSetup_eng.exe
  # basic folders
  install -dm775 ${pkgdir}/opt/cosmicbreak
  install -dm644 ${pkgdir}/usr/share/licenses/${pkgname}/
  install -dm644 ${pkgdir}/usr/share/doc/${pkgname}/

  # exe file can be decompressed as .cab
  cabextract --directory=${pkgdir}/opt/cosmicbreak/ ${_fileinstaller}
  
  # remove unused files
  rm -f ${pkgdir}/opt/cosmicbreak/install-panel.bmp
  rm -f ${pkgdir}/opt/cosmicbreak/install-icon.bmp
  rm -f ${pkgdir}/opt/cosmicbreak/cs-banner.bmp
  rm -f ${pkgdir}/opt/cosmicbreak/CosmicBreak.com.URL
  
  # group and permissions
  chgrp games -R ${pkgdir}/opt/cosmicbreak/
  chmod 775 -R ${pkgdir}/opt/cosmicbreak/
  
  # extract icons
  wrestool -x -n 256 ${pkgdir}/opt/cosmicbreak/CosmicBreak.exe > \
    ${srcdir}/cosmicbreak.ico
  convert ${srcdir}/cosmicbreak.ico ${srcdir}/cosmicbreak.png
  
  # copyright and license
  mv ${pkgdir}/opt/cosmicbreak/CosmicBreakClientSoftwareLicenseAgreement.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mv ${pkgdir}/opt/cosmicbreak/readme.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT
  mv ${pkgdir}/opt/cosmicbreak/StageEditorManual.pdf \
    ${pkgdir}/usr/share/doc/${pkgname}/
  
  # menu icon
  install -Dm644 ${srcdir}/cosmicbreak.desktop \
    ${pkgdir}/usr/share/applications/cosmicbreak.desktop
  install -Dm644 ${srcdir}/cosmicbreak.sh \
    ${pkgdir}/usr/bin/cosmicbreak
  chmod +x ${pkgdir}/usr/bin/cosmicbreak
  
  # icons
  install -Dm644 ${srcdir}/cosmicbreak-0.png \
    ${pkgdir}/usr/share/icons/hicolor/16x16/apps/cosmicbreak.png
  install -Dm644 ${srcdir}/cosmicbreak-2.png \
    ${pkgdir}/usr/share/icons/hicolor/32x32/apps/cosmicbreak.png
  install -Dm644 ${srcdir}/cosmicbreak-4.png \
    ${pkgdir}/usr/share/icons/hicolor/64x64/apps/cosmicbreak.png
  
  rm ${srcdir}/cosmicbreak-*.png
}
