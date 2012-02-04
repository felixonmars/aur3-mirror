# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xbomber
pkgver=0.8
pkgrel=1
pkgdesc="Multiplayer maze-style game where players collect and drop bombs"
arch=('i686' 'x86_64')
url="http://www.newbreedsoftware.com/xbomber/"
license=('custom')
depends=('libx11')
source=("ftp://ftp.tuxpaint.org/unix/x/${pkgname}/${pkgname}.${pkgver}.tar.gz"
        "${pkgname}.patch"
        "LICENSE")
md5sums=('c17b5dda0241d29ea4644b2906985716'
         '17d9f25794cf3aa38b80cbab2d47a18f'
         '8e15ab0a46535f0a76ca970a45d4fc26')

build() {
  cd "${srcdir}/${pkgname}"

  # Fix paths for data files
  patch -p0 -i "../${pkgname}.patch"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -rf bitmaps jungle levels pixmaps sounds "${pkgdir}/usr/share/${pkgname}"

  # Install docs and license
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 {GRAPHICS,LEVELS,README,SOUND}.txt "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
