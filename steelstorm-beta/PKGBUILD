# Contributor: wido < widomaker2k7@gmail.com >

pkgname=steelstorm-beta
_pkgname=steelstorm
pkgver=1600
_pkgver=1591
_patchver=1600
pkgrel=1
pkgdesc="a classic top down shooter, rife with explosions and things to explode, with a distinct visual style."
arch=('i686' 'x86_64')
url="http://www.steel-storm.com/"
license=('CUSTOM')
depends=('curl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libvorbis' 'libogg' 'libmodplug' 'freetype2')
makedepends=()
source=(http://download1.steel-storm.com/${pkgname}-r${_pkgver}.tar.gz
        http://download1.steel-storm.com/${pkgname}-r${_patchver}-patch2.tar.gz
        steelstorm.desktop
        steelstorm.sh
        steelstorm-dedicated.desktop
        steelstorm-dedicated.sh)
md5sums=('8295404751c862dc41ed1f169eb911bb'
         'f2151d39354f4f81ec538f93b5ced3d5'
         '32005427334b8888f175165f6a928c6b'
         '73d596ac67fb34ebc28df1f89b789dc2'
         '37765811bd5cc7349cee57623a1d7797'
         '565ec1b72aff78bd2e311c289b65e2d5')

build() {
  cd ${srcdir}/${_pkgname}
  mkdir -p ${pkgdir}/opt/
  # Game
  cp -r ${srcdir}/${_pkgname} ${pkgdir}/opt/

  # Patch
  cp -r ${srcdir}/gamedata ${pkgdir}/opt/${_pkgname}/

  if [ "${CARCH}" = "x86_64" ]; then
      # Delete bin 32 bits
      rm ${pkgdir}/opt/${_pkgname}/${_pkgname} ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated
      install -Dm 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}64 ${pkgdir}/opt/${_pkgname}/${_pkgname}
      install -Dm 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}64-dedicated ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated

  elif [ "${CARCH}" = "i686" ]; then
      # Delete bin 64 bits
      rm ${pkgdir}/opt/${_pkgname}/${_pkgname}64 ${pkgdir}/opt/${_pkgname}/${_pkgname}64-dedicated
  
  else

      echo "If you're not running x86_64 or i686, how are you running Arch?"
      return 1
  fi

  # Install .desktop, icon, license and bin
  install -Dm 644 ${srcdir}/steelstorm.desktop ${pkgdir}/usr/share/applications/steelstorm.desktop
  install -Dm 755 ${srcdir}/steelstorm.sh $pkgdir/usr/bin/steelstorm
  install -Dm 644 ${srcdir}/steelstorm-dedicated.desktop ${pkgdir}/usr/share/applications/steelstorm-dedicated.desktop
  install -Dm 755 ${srcdir}/steelstorm-dedicated.sh $pkgdir/usr/bin/steelstorm-dedicated

  install -Dm 644 ${pkgdir}/opt/${_pkgname}/icons/steelstorm_icon_64x64.png ${pkgdir}/usr/share/pixmaps/steelstorm.png
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/license.txt ${pkgdir}/usr/share/licenses/license.txt
}
