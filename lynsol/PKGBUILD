# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=lynsol
pkgver=2.0.1
pkgrel=1
pkgdesc="A collection of classic Solitaire card games"
arch=('any')
url="http://sourceforge.net/projects/lynsolsolitaire/"
license=('GPL' 'custom')
depends=('python-imaging' 'python-pygame' 'wxpython' 'xchm')
source=("http://www.mediafire.com/file/v6zddtzmsgde1t6/${pkgname}_${pkgver}-1_i386.deb"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "LICENSE_DATA")
md5sums=('b8732f06c110dd28fba843f722a8f74a'
         'de2c62b58b8aa7b38a48c1eca6a1bdf9'
         '730ca92bc580b557ac2e14ff81c7e557'
         '4e3a50a9ec2316348a47407d49864b48')

package() {
  cd "${srcdir}"

  # Install game files
  bsdtar xf data.tar.gz -C "${pkgdir}"
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Move 'Snow Flake' file to fix a crash
  mv "${pkgdir}/usr/share/cards/cardbacks/"{Snow\ Flake,Snow\ Flake\ licences}

  # Delete some unneeded files
  rm -rf "${pkgdir}/usr/share/"{applications,doc} \
         "${pkgdir}/usr/share/${pkgname}/Cards/new file"

  # Set permissions
  find "${pkgdir}/usr/share" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share" -type f -exec chmod 644 '{}' \;

  # Python 2 fix
  sed -i "s_python_&2_" "${pkgdir}/usr/share/${pkgname}/"*.py

  # Install a desktop entry
  install -Dm644 "${pkgdir}/usr/share/${pkgname}/Cards/Solitaire.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a license file
  install -Dm644 ../LICENSE_DATA "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_DATA"
}
