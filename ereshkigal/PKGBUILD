# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=ereshkigal
pkgver=0.3
pkgrel=4
pkgdesc="An AutoSSH tunnel monitor"
arch=('any')
url="http://sourceforge.net/projects/ereshkigal/"
license=('GPL3')
depends=('autossh' 'python2')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.gz/download")
sha256sums=('33702c2e17824e513559084627af7da6c666da3d8463bf444e37f2b1e2ed9ecf')

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  sed 's|/usr/bin/python|/usr/bin/python2|g' -i ereshkigal.py
  install -D ereshkigal.py "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
