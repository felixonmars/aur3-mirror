# Mantainer: Nicolas Lehmann <nlehmann@dcc.uchile.cl>

pkgname=cuevana-storm
pkgver=0.3.2
pkgrel=1
pkgdesc="Cuevana Storm desktop app based in peerflix module."
arch=('x86_64' 'i686')
url="http://www.cuevana.tv"
license=('MIT')
makedepends=('nodejs' 'git')
options=('!strip')
install="cuevana-storm.install"
_gitname=storm
md5sums=('f3c89c316383cd0cc1f27478a5e59915'
        'e2a41605cef2aa34554697bed2303f36'
        'SKIP')

if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
elif [ "$CARCH" = 'x86_64' ]; then
  _platform=linux64
fi

source=("cuevana-storm.install"
        "cuevana-storm.desktop"
        "git+https://github.com/Cuevana/storm.git#tag=v$pkgver")

prepare() {
  cd "${srcdir}/${_gitname}"

  # Fix to work with pacaur
  sed -i -r 's/.*nodewebkit": "0.10.4".*//' "${srcdir}/${_gitname}/package.json"

  # Get dependencies
  npm install
}

build() {
  cd "${srcdir}/${_gitname}"

  npm run build
}

package() {
  cd "${srcdir}"
  
  _bpath="${srcdir}/${_gitname}/build/Cuevana Storm/${_platform}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_bpath}/Cuevana Storm" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/icudtl.dat" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/libffmpegsumo.so" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/nw.pak" "${pkgdir}/usr/lib/${pkgname}/"

  # Link
  ln -s "/usr/lib/${pkgname}/Cuevana Storm" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop File
  install -Dm644 "${srcdir}/cuevana-storm.desktop" "${pkgdir}/usr/share/applications/cuevana-storm.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_gitname}/app/assets/icons/512x512.png" "${pkgdir}/usr/share/pixmaps/cuevana-storm.png"
}
