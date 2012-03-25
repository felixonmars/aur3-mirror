# Maintainer: JW Lee <xiv@daum.net>
pkgname=otf-nanum
pkgver=3.1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Nanum series OpenType Fonts"
arch=('any')
url="http://hangeul.naver.com/"
license=('OFL')
source=('http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_OTF_ALL.zip'
        'http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFontSetup_OTF_GOTHICLIGHT.zip')
install=$pkgname.install
md5sums=('07c0c10d5700bb38b1664bfa9d0c3a04'
         '345a850966b6f99f53c771c50ebc3e3a')

build()
{
  install -dm755 "${pkgdir}"/usr/share/fonts/OTF
  install -m644 "${srcdir}"/*.otf "${pkgdir}"/usr/share/fonts/OTF/
}
