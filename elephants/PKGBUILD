# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Xavier de Labouret <arch@2-lab.net>

pkgname=elephants
pkgver=2007.02.06
pkgrel=3
pkgdesc="Save the giraffes while jumping on a rolled up squirrel"
arch=('any')
url="http://www.imitationpickles.org/elephant/"
license=('custom')
depends=('python-pygame')
source=("http://www.imitationpickles.org/elephant/elephant.tgz"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('cf0e43d77da92e1e6ebc18e3b7aaacde'
         '3ba2b1bf418bbbd893e377011f232785'
         '5f6de5ed02256675774752f008a56c71'
         'c5e18216a4749d21e4dbcc9adde52e14')

package() {
  cd "${srcdir}/elephant"

  # Fix the path for the high scores file
  sed -i "s_elephant.hs_/var/lib/elephants/elephant.hs_" main.py

  # Install game files
  mkdir -p "${pkgdir}/usr/share/${pkgname}/data"
  cp data/*.{png,wav,ogg,ttf} "${pkgdir}/usr/share/${pkgname}/data"
  cp -r pgu *.py "${pkgdir}/usr/share/${pkgname}"

  # Create the high scores file
  mkdir -p "${pkgdir}/var/lib/elephants"
  touch "${pkgdir}/var/lib/elephants/elephant.hs"
  chmod 666 "${pkgdir}/var/lib/elephants/elephant.hs"

  # Install the .desktop, pixmap and launcher files
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install doc files
  install -Dm644 README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 data/read_me.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_FONTS"
}
