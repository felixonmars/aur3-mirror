# Contributor : Vladimir Navrat <vn158 at seznam dot cz>

pkgname=ttf-kurier
pkgver=0.995
pkgrel=1
pkgdesc="TrueType font Kurier by Malgorzata Budyta"
arch=(any)
license=('custom:GUST')
url="http://nowacki.strefa.pl/kurier.html"
install=ttf.install
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
source=("http://nowacki.strefa.pl/pliki/Kurier-ttf-0_995.zip" LICENSE)
md5sums=('636124244664ec027493e74a89964745'
         '3eb34a8f035799bd0a2beef4626c314e')
sha256sums=('ef51e34af788a03528a982f2493983a468feb714341337fdb38711077becd833'
            '4b3359f51f8a203dca048088bc63acbb57f379e83bef9e0b0f294b9a47394725')

build() {
  cd ${startdir}
  mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname
  install -m644 LICENSE ${startdir}/pkg/usr/share/licenses/$pkgname/
  cd ${startdir}/src
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}
