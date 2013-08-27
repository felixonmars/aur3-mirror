# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=source-code-pro-fonts-powerline
pkgver=1.017
pkgrel=3
pkgdesc="A set of monospaced fonts (TTF & OTF) designed for coding environments"
arch=('any')
license=('custom:OFL')
url='http://sourceforge.net/projects/sourcecodepro.adobe/'
depends=('fontconfig'
	 'powerline-fontpatcher'
	 'xorg-mkfontdir'
	 'xorg-mkfontscale')
install=source-code-pro-fonts.install
source=("http://downloads.sourceforge.net/sourcecodepro.adobe/SourceCodePro_FontsOnly-$pkgver.zip"
	"$install")
md5sums=('e59ce4be04d44c22e380865142bad0e3'
         '714e3cc3255bc4481fffd5ae1ad48d25')

prepare()
{
  cd "${srcdir}/SourceCodePro_FontsOnly-${pkgver}"
  find -type f -name '*for Powerline*' -exec rm {} \+
}

build() {
  cd "${srcdir}/SourceCodePro_FontsOnly-${pkgver}"
  pushd OTF
  for f in *.otf
  do
	  powerline-fontpatcher "$f"
  done
  popd
  pushd TTF
  for f in *.ttf
  do
	  powerline-fontpatcher "$f"
  done
  popd
}

package() {
  cd "${srcdir}/SourceCodePro_FontsOnly-${pkgver}"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 TTF/*Powerline*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 OTF/*Powerline*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
