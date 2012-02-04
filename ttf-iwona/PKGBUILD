# Contributor: Vladimir Navrat <vn158 at seznam dot cz>

pkgname=ttf-iwona
pkgver=0.995
pkgrel=1
pkgdesc="TrueType font Iwona by Malgorzata Budyta"
arch=(any)
license=('custom:GUST')
url="http://nowacki.strefa.pl/kurier.html"
install=ttf.install
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
source=("http://nowacki.strefa.pl/pliki/Iwona-ttf-0_995.zip" LICENSE)
md5sums=('8aee3aa223471a49815818cf7be39cb0'
         '3eb34a8f035799bd0a2beef4626c314e')
sha256sums=('72e50a2c7a580fdd102820124b0debcf38fa68654fc27795d34bcad1c53b1f2d'
            '4b3359f51f8a203dca048088bc63acbb57f379e83bef9e0b0f294b9a47394725')

build() {
  cd ${startdir}
  mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname
  install -m644 LICENSE ${startdir}/pkg/usr/share/licenses/$pkgname/
  cd ${startdir}/src
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}
