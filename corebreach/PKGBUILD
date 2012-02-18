# Maintainer: TastyPi <grogers3.14@gmail.com>
pkgname=corebreach
_appname=CoreBreach
pkgver=1.1.5
pkgrel=1
pkgdesc='Futuristic "anti-gravity" racing game with combat-based gameplay. (Requires copy of game)'
arch=('x86_64' 'i686')
url="http://corebreach.corecode.at/"
license=('custom: "commercial"')
depends=('sdl' 'sdl_mixer' 'openal' 'libgl' 'cairo' 'gtk2' 'libxt' 'zlib')
source=("${pkgname}.sh" "${pkgname}.desktop")
md5sums=('f84c8f014e3a084c8253b79c0d1e82ef'
         '448095f70ce219bdc13d80602c1221e9')

if test "$CARCH" == x86_64; then
  source=("${source[@]}" "file://${pkgname}_${pkgver}_amd64.tar")
  md5sums=("${md5sums[@]}" '6bcf71198fb81126d1efe78e7da100fc')
else
  source=("${source[@]}" "file://${pkgname}_${pkgver}_i386.tar")
  md5sums=("${md5sums[@]}" 'cf01d95c68eafb52e23c66db1b431d07')
fi


build() {
  true #functions can't be empty in bash
}

package() {
  if test "$CARCH" == x86_64; then
    cd ${srcdir}/${_appname}-${pkgver}-Linux64
  else
    cd ${srcdir}/${_appname}-${pkgver}-Linux32
  fi
  
  # Install game data
  install -d ${pkgdir}/opt/${pkgname}
  cp -r ./* ${pkgdir}/opt/${pkgname}
  
  cd ${srcdir}
  
  # Install shell script to start the game
  install -d ${pkgdir}/usr/bin
  install ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  
  # Install .desktop file
  install -d ${pkgdir}/usr/share/applications
  install ${pkgname}.desktop ${pkgdir}/usr/share/applications
}

