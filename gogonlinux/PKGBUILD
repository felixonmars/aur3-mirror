# Maintainer: Damien Firmenich fir.damien (gmail)

pkgname=gogonlinux
pkgver=0.2.6
pkgrel=3
pkgdesc="Client for GOG games on Linux"
arch=('any')
url="http://gogonlinux.com/"
license=('BSD')
githash="498b1ce6cf3a6a9e4088b4f5d1cc4c4d6f65401d"
source=("https://github.com/Morgawr/gogonlinux/archive/${githash}.tar.gz")
depends=('innoextract'
         'libglade'
         'python2'
         'python2-certifi'
         'python2-oauth2'
         'python2-requests'
         'pygtk'
         'winetricks')
optdepends=('wine: For wine emulation'
           'scummvm: For lucasarts SCUMM virtualisation'
           'dosbox: For DOS emulation')
sha1sums=('cb4abb0eb79ce5085984cb57dbc686a55a45ff3e')

prepare() {
  cd "${srcdir}/${pkgname}-${githash}"
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/python2|" {setup.py,gog-installer,gog-tux}
}

package() {
  cd "${srcdir}/${pkgname}-${githash}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  # setup.py installs to /usr/local by default, so we need to move the files
  mv "${pkgdir}/usr/local/share" "${pkgdir}/usr"
  mv "${pkgdir}/usr/local/man" "${pkgdir}/usr/share"
  rmdir "${pkgdir}/usr/local"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
