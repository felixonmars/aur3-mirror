# Contributor: wido < widomaker2k7@gmail.com >

episode=ep1
pkgname=steelstorm
pkgver=10002718
_build=1.00.02718
pkgrel=2
pkgdesc="a classic top down shooter, rife with explosions and things to explode, with a distinct visual style."
arch=('i686' 'x86_64')
url="http://www.steel-storm.com/"
license=('CUSTOM')
depends=('curl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libvorbis' 'libogg' 'libmodplug' 'freetype2' 'libjpeg6')
provides=('steelstorm')
replaces=('steelstorm-beta')
makedepends=()
source=(http://download2.steel-storm.com/${pkgname}-${episode}-v${_build}.tar.gz
        steelstorm.desktop
        steelstorm.sh
        steelstorm-dedicated.desktop
        steelstorm-dedicated.sh)
md5sums=('90f2369812e4c5025c711630fc5c87de'
         '32005427334b8888f175165f6a928c6b'
         '73d596ac67fb34ebc28df1f89b789dc2'
         '37765811bd5cc7349cee57623a1d7797'
         '565ec1b72aff78bd2e311c289b65e2d5')

build() {
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/opt/
  # Game
  cp -r ${srcdir}/${pkgname} ${pkgdir}/opt/

  # Patch
  #cp -r ${srcdir}/gamedata ${pkgdir}/opt/${_pkgname}/

  if [ "${CARCH}" = "x86_64" ]; then
      # Delete bin 32 bits
      rm ${pkgdir}/opt/${pkgname}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname}-dedicated
      install -Dm 755 ${pkgdir}/opt/${pkgname}/${pkgname}64 ${pkgdir}/opt/${pkgname}/${pkgname}
      install -Dm 755 ${pkgdir}/opt/${pkgname}/${pkgname}64-dedicated ${pkgdir}/opt/${pkgname}/${pkgname}-dedicated

  elif [ "${CARCH}" = "i686" ]; then
      # Delete bin 64 bits
      rm ${pkgdir}/opt/${pkgname}/${pkgname}64 ${pkgdir}/opt/${pkgname}/${pkgname}64-dedicated
  else
      echo "If you're not running x86_64 or i686, how are you running Arch?"
      return 1
  fi

  # Install .desktop, icon, license and bin
  install -Dm 644 ${srcdir}/steelstorm.desktop ${pkgdir}/usr/share/applications/steelstorm.desktop
  install -Dm 755 ${srcdir}/steelstorm.sh $pkgdir/usr/bin/steelstorm
  install -Dm 644 ${srcdir}/steelstorm-dedicated.desktop ${pkgdir}/usr/share/applications/steelstorm-dedicated.desktop
  install -Dm 755 ${srcdir}/steelstorm-dedicated.sh $pkgdir/usr/bin/steelstorm-dedicated

  install -Dm 644 ${pkgdir}/opt/${pkgname}/icons/steelstorm_icon_64x64.png ${pkgdir}/usr/share/pixmaps/steelstorm.png
  install -Dm 644 ${pkgdir}/opt/${pkgname}/license.txt ${pkgdir}/usr/share/licenses/license.txt
}
