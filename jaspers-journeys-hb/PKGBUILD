# Contributor: Denis Moiseev <imdens@gmail.com>
# Maintainer:  Fabian Schoelzel <fabian.schoelzel@googlemail.com>

pkgname=jaspers-journeys-hb
pkgver=2.15
pkgrel=1
pkgdesc="[Humble Bundle] A fantasy retro platform game."
url="http://www.lexaloffle.com/jasper.php"
license=('custom: "commercial"')
groups=('humblevoxatronbundle' 'humblebundles')
arch=('i686' 'x86_64')
[ "${CARCH}" = "i686" ] && depends=('libgl' 'sdl')
[ "${CARCH}" = "x86_64" ] && depends=('lib32-libgl' 'lib32-sdl')
[ "${CARCH}" = "i686" ] && optdepends=('alsa-lib: sound support' 'libpulse: sound support')
[ "${CARCH}" = "x86_64" ] && optdepends=('lib32-alsa-lib: sound support' 'lib32-libpulse: sound support')
makedepends=()
options=(!strip)
source=(jaspers-journeys.desktop
        jaspers-journeys-run)
md5sums=('8903d95786721a631dac247d0a86c8d1'
         'cd3506b1a50dfe368e8c448edb93b5a0')

_gamepkgname="jaspers-journeys"
_gamepkg="${_gamepkgname}_${pkgver}_i386.tar.gz"

build() {
  cd "${srcdir}"
  msg "You need a full copy of this game in order to install it"
  msg "Searching for ${_gamepkg} in dir: $(readlink -f `pwd`/..)"
  if [[ -f "../${_gamepkg}" ]]; then
    msg "Found game package, installing..."
    ln -fs "../${_gamepkg}" .
  elif [ -n "${_humblevoxatronkey}" ]; then
    msg "Game package not found, trying to download..."
    rm -f index.html\?key\=${_humblevoxatronkey}*
    wget http://www.humblebundle.com/?key=${_humblevoxatronkey}
    wget $(cat index.html\?key\=${_humblevoxatronkey} | grep "${_gamepkg}" | cut -d "'" -f 10)
    mv ${_gamepkg}* ${_gamepkg}
  else
    msg "Game package not found and download failed."
    msg "You can add \'export _humblevoxatronkey\=\<Your key here\>\' to \.bashrc if you want automated download ability."
    error "Please type absolute path to ${_gamepkg} (/home/joe):"
    read pkgpath
    if [[ -f "${pkgpath}/${_gamepkg}" ]]; then
      msg "Found game package, installing..."
      ln -fs "${pkgpath}/${_gamepkg}" .
    else
      error "Unable to find game package."
      return 1
    fi
  fi
  tar zxf ${_gamepkg}
  [ "${CARCH}" = "x86_64" ] && sed -i "s/\.\/jasper/LD_LIBRARY_PATH=\/usr\/lib32\/ \.\/jasper/g" jaspers-journeys-run
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/opt/${_gamepkgname}"
  install -D -m755 jaspers-journeys/jasper "${pkgdir}/opt/${_gamepkgname}/jasper"
  install -D -m644 jaspers-journeys/jasper.dat "${pkgdir}/opt/${_gamepkgname}/jasper.dat"
  install -D -m644 jaspers-journeys/jaspers-journeys.txt "${pkgdir}/opt/${_gamepkgname}/jaspers-journeys.txt"
  install -D -m644 jaspers-journeys/lexaloffle-jasper.png "${pkgdir}/usr/share/icons/jaspers-journeys.png"
  install -D -m644 jaspers-journeys/license.txt "${pkgdir}/usr/share/licenses/${_gamepkgname}/LICENSE"
  install -D -m755 jaspers-journeys-run "${pkgdir}/usr/bin/jaspers-journeys"
  install -D -m644 jaspers-journeys.desktop "${pkgdir}/usr/share/applications/jaspers-journeys.desktop"
}
md5sums=('8903d95786721a631dac247d0a86c8d1'
         '2c4fe4b16d04dd13929d3e046965c744')
