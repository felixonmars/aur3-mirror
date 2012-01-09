# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
# Maintainer: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )

pkgname=ttf-microsoft-arial
pkgver=5.10
pkgrel=1
pkgdesc="A contemporary sans serif design, Arial contains more humanist characteristics than many of its predecessors and as such is more in tune with the mood of the last decades of the twentieth century."
arch=('any')
license=('unknown')
url="http://www.microsoft.com/typography/fonts/family.aspx?FID=8"
depends=('fontconfig')
install=ttf-microsoft-arial.install
source=('http://gthemes-china.googlecode.com/files/Arial.tar.gz')
md5sums=('b4df0863225f31c2d4d4c97b820279d1')

build() {
  install -Dm644 ${srcdir}/arial.ttf ${pkgdir}/usr/share/fonts/microsoft/arial.ttf
  install -Dm644 ${srcdir}/arialbd.ttf ${pkgdir}/usr/share/fonts/microsoft/arialbd.ttf
  install -Dm644 ${srcdir}/arialbi.ttf ${pkgdir}/usr/share/fonts/microsoft/arialbi.ttf
  install -Dm644 ${srcdir}/ariali.ttf ${pkgdir}/usr/share/fonts/microsoft/ariali.ttf
}
