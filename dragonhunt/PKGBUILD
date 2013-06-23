# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte__gmail>

pkgname=dragonhunt
pkgver=3.56
pkgrel=5
pkgdesc="An extensible graphical RPG written in Python"
arch=('any')
url="http://emhsoft.com/dh.html"
license=('GPL' 'CCPL' 'custom')
depends=('python2' 'python2-pygame')
install="${pkgname}.install"
source=("http://emhsoft.com/dh/Dragon_Hunt-${pkgver}.tar.gz"
	"${pkgname}.sh"
	"${pkgname}-editor.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('fa5aecc577b8ea7ece211c8f20ff1f0a'
         '646d68ea88fde7e715d6e842dc50e5d5'
         '5192cd9dcfa3179a8ebbdfc9003c6f1d'
         'a6edb433a13b672ad35a1616879ab64c'
         'f166db03e38f0b06cf81feeb6397b8ac')

package() {
  cd "${srcdir}/Dragon_Hunt-${pkgver}"

  # Remove unnecessary files
  rm code/.{cvsignore,directory}

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r code modules "${pkgdir}/opt/${pkgname}"
  install -m664 -g games settings.txt "${pkgdir}/opt/${pkgname}"
  install -m775 -g games -d \
    "${pkgdir}/opt/${pkgname}/modules/"{Dark\ Ages,Dragon\ Hunt}/{data/maps,saves}

  # Install launchers
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "../${pkgname}-editor.sh" "${pkgdir}/usr/bin/${pkgname}-editor"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 docs/* README.txt "${pkgdir}/usr/share/doc/${pkgname}"

  # Install license
  sed -n "/Graphic License/,/access to anyway/p" README.txt > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
