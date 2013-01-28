# Contributor: xnitropl <xnitropl at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>


pkgname=7kaa-data
pkgver=2.13
pkgrel=3
pkgdesc="Free data set for Seven Kingdoms: Ancient Adversaries"
url='http://7kfans.com/'
arch=('any')
license=('GPL2')
source=("http://downloads.sourceforge.net/project/skfans/Seven%20Kingdoms%20AA%20Data%20Files/$pkgname-$pkgver.tar.bz2")
md5sums=('d7580a683fabcea98b5898dff252dcf2')


package() {
  # install data files
  install -dm755 "${pkgdir}/opt/7kaa/"
  cd "${srcdir}/7kaa/"
  cp -r {encyc,encyc2,image,resource,scenari2,scenario,sound,sprite,tutorial} "${pkgdir}/opt/7kaa/"

  # fix permissions
  cd "${pkgdir}/opt/7kaa/"
  find . -type d -exec chmod 755 {} \;

  # copy readme
  install -D -m644 "${srcdir}/7kaa/README-GameData" "${pkgdir}/usr/share/doc/7kaa/README-GameData"
}

# vim:set ts=2 sw=2 et:
