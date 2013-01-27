pkgname=otf-sao
pkgver=1
pkgrel=1
pkgdesc="Sword Art Online Font by darkblackswords"
url="http://darkblackswords.deviantart.com/art/Sword-Art-Online-Font-342305125"
arch=any
depends=(fontconfig xorg-font-utils)
install=otf-sao.install
license=custom
md5sums=('a41a73baa6d5913da4641d1c45cc301e')
source=(http://www.deviantart.com/download/342305125/sword_art_online_font_by_darkblackswords-d5nssbp.otf
)

build() {
  mkdir -p "${pkgdir}"/usr/share/fonts/OTF
  cp "${srcdir}"/*.otf "${pkgdir}"/usr/share/fonts/OTF
}
