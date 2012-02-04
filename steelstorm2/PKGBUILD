# Inspired by wido's steelstorm (episode 1) pkgbuild
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=steelstorm2
_pkgname=steelstorm
pkgver=2.00
pkgrel=02876
pkgdesc="a classic top down shooter, rife with explosions and things to explode, with a distinct visual style"
arch=('i686' 'x86_64')
url="http://www.steel-storm.com/"
license=('commercial')
install=(${_pkgname}.install)
depends=('curl' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'libvorbis' 'libogg' 'libmodplug' 'freetype2')
replaces=('steelstorm')
source=(steelstorm-br-${pkgver}.02626-release.tar.gz
	steelstorm-br-${pkgver}.${pkgrel}-cummulative-patch.tar.gz
        steelstorm.desktop
        steelstorm.sh
        steelstorm-dedicated.desktop
        steelstorm-dedicated.sh)
noextract=(steelstorm-br-${pkgver}.${pkgrel}-cummulative-patch.tar.gz)
options=(!strip)
md5sums=('dec4ca58f1fc300a015ebba8768068b7'
         '73899b1c853258474507d3ff83211ef0'
         '92dbfd2bc861c56f4ed0be5fe1885cb3'
         '73d596ac67fb34ebc28df1f89b789dc2'
         '37765811bd5cc7349cee57623a1d7797'
         '565ec1b72aff78bd2e311c289b65e2d5')

build() {
true
}

package() {
  cd ${srcdir}
  # patch
  mkdir patch; cd patch
  tar xzf ${srcdir}/steelstorm-br-${pkgver}.${pkgrel}-cummulative-patch.tar.gz
  mv * ../steelstorm || true
  mv gamedata/* ../steelstorm/gamedata
  cd ..
 
  cd ${_pkgname}
  mkdir -p ${pkgdir}/opt/
  
  cp -r ${srcdir}/${_pkgname} ${pkgdir}/opt/
  find ${pkgdir}/opt/steelstorm/gamedata -type f -exec chmod 0644 '{}' \;

  if [ "${CARCH}" = "x86_64" ]; then
      # Delete bin 32 bits
      rm ${pkgdir}/opt/${_pkgname}/${_pkgname} ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated
      install -Dm 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}64 ${pkgdir}/opt/${_pkgname}/${_pkgname}
      install -Dm 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}64-dedicated ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated

  elif [ "${CARCH}" = "i686" ]; then
      # Delete bin 64 bits
      rm ${pkgdir}/opt/${_pkgname}/${_pkgname}64 ${pkgdir}/opt/${_pkgname}/${_pkgname}64-dedicated
      chmod 0755 ${pkgdir}/opt/${_pkgname}/${_pkgname}
      chmod 0755 ${pkgdir}/opt/${_pkgname}/${_pkgname}-dedicated
  
  else

      echo "If you're not running x86_64 or i686, how are you running Arch?"
      return 1
  fi

  # Install .desktop, icon, license and bin
  install -Dm 644 ${srcdir}/steelstorm.desktop ${pkgdir}/usr/share/applications/steelstorm.desktop
  install -Dm 755 ${srcdir}/steelstorm.sh $pkgdir/usr/bin/steelstorm
  install -Dm 644 ${srcdir}/steelstorm-dedicated.desktop ${pkgdir}/usr/share/applications/steelstorm-dedicated.desktop
  install -Dm 755 ${srcdir}/steelstorm-dedicated.sh $pkgdir/usr/bin/steelstorm-dedicated

  install -Dm 644 ${pkgdir}/opt/${_pkgname}/icons/ss_ep2_icon_64.png ${pkgdir}/usr/share/pixmaps/steelstorm.png
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/license.txt ${pkgdir}/usr/share/licenses/license.txt
}
