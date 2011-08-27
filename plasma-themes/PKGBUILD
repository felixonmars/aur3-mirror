# Maintainer: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=plasma-themes
pkgver=20091027
pkgrel=2
pkgdesc="Top 10 highest-rated themes for Plasma (Except the themes in kdeartwork)"
arch=(any)
license=('GPL')
url="http://kde-look.org/index.php?xcontentmode=76"
depends=('kdebase-plasma')
makedepends=('findutils')
_url="http://kde-look.org/CONTENT/content-files"
source=(${_url}/81388-Glassified.tar.gz
        ${_url}/107252-Carbon.tar.gz
        ${_url}/84403-Arezzo.tar.gz
        ${_url}/107902-ghost.tar.gz
        ${_url}/105796-Oxyzone.tar.gz
        ${_url}/109479-Gaia_Recycled.tar.gz
        ${_url}/98341-Eleonora.tar.gz
        ${_url}/94798-Nitro2.0.tar.gz
        ${_url}/80239-Marysia.tar.gz
        ${_url}/83976-Glaze-0.4.tar.bz2)

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/apps/desktoptheme
  find . -type d -print0 | xargs -0 chmod 0775
  find . -type f -print0 | xargs -0 chmod 0664
  find . -name '*.desktop' -print0 | xargs -0 chmod 777
  cp -rf "Glassified" "Carbon" "Arezzo" "Ghost" "Oxyzone" \
         "Gaia_Recycled" "Eleonora" "Nitro2.0" "Marysia" "Glaze" \
         ${pkgdir}/usr/share/apps/desktoptheme
}
md5sums=('64cec8bf2796860ffee638fcca1233de'
         '54c49965081278f1edf361af936bc804'
         'e04d04a6c65f8c86503df74978eaaac6'
         '9c7d942d5bd70957ea0b6f4d58f30da4'
         '40eb9d3e9533b0cd506576aea4a356a7'
         '296aad1768b0108da7075cf5b37f90e1'
         '161662ec066dffb52a6ba1872b7cb7a6'
         '0113c1e9d63368473b23c4afaae7c591'
         '2d7907aabdf05849339dcfc769c9009f'
         'f4dfb8ccf687b927e0bd9b04f706fe53')
