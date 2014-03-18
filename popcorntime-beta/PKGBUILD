# Maintainer: Tom Kwok <contact@tomkwok.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime-beta
_pkgname=popcorntime
pkgver=0.2.7
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('x86_64')
url="https://github.com/popcorn-team/popcorn-app/"
license=('custom')
makedepends=('zip')
depends=('libudev.so.0')
conflicts=('popcorntime' 'popcorntime-git')
options=('!strip')
source=("http://static.cdnjd.com/releases/popcorn/Popcorn-Time-2.7-Linux-64.tgz"
        "popcorntime_256x256.png"
        "popcorntime_128x128.png"
        "popcorntime_64x64.png"
        "popcorntime_48x48.png"
        "popcorntime_32x32.png"
        "popcorntime_16x16.png"
        "popcorntime.desktop"
        "https://raw.github.com/Yify/popcorn-app/v${pkgver}-beta/LICENSE.txt")
md5sums=('0173efaffed2bc867888650af52b19ca'
         '1f5f2750318070c2c78898e01b86841c'
         'da9f9f461da4ea98c8c29df585df4550'
         '4a5dd8c9903dcab2a60a584ae1c1bd35'
         '2778b3b132d1761b706dc688d72e0cdc'
         'e28b39fce60f77f106ee796f137ae5f2'
         '5533938c64d529f85f2e74a3e8c31efb'
         '9608f35f4cc083a0c36b0f4ef275ab10'
         '985eca66feaf0170850231d4616b3074')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/lib"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -Dm755 Popcorn-Time "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm744 nw.pak "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm755 libffmpegsumo.so "${pkgdir}/usr/lib/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/popcorntime_16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/popcorntime.png"
  install -Dm644 "${srcdir}/popcorntime_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/popcorntime.png"
  install -Dm644 "${srcdir}/popcorntime_48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/popcorntime.png"
  install -Dm644 "${srcdir}/popcorntime_64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/popcorntime.png"
  install -Dm644 "${srcdir}/popcorntime_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/popcorntime.png"
  install -Dm644 "${srcdir}/popcorntime_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/popcorntime.png"


  # License
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
