# Maintainer: Dominic Finke

pkgname=gogonlinux-df
pkgver=0.2.6
pkgrel=2
pkgdesc="Client for GOG games on Linux"
arch=('any')
url="http://www.realbig.de"
license=('BSD')
source=("http://www.realbig.de/dl/${pkgname}-${pkgver}.tar.gz")
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
md5sums=('b048809f120e36c18114b5dc9f80fff4')

prepare() {
  tar xf "${pkgname}-${pkgver}.tar"
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/python2|" {setup.py,gog-installer,gog-tux}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  # setup.py installs to /usr/local by default, so we need to move the files
  mv "${pkgdir}/usr/local/share" "${pkgdir}/usr"
  mv "${pkgdir}/usr/local/man" "${pkgdir}/usr/share"
  rmdir "${pkgdir}/usr/local"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
