# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>

pkgname=raptrtrackr
pkgver=2.0
pkgrel=1
pkgdesc="A simple cross-platform tool to manually track any game existing in your account on Raptr.com"
arch=('any')
url="http://www.redsquirrel87.com/RaptrTrackr.html"
license=('freeware')
depends=('java-runtime')
install='raptrtrackr.install'
source=(https://bitbucket.org/Red_Squirrel/raptr-trackr/downloads/${pkgname}-AUR-${pkgver}.tar.gz)
md5sums=('09607ea0167ef06caa9f25231455fce6')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cp -R opt $pkgdir
  install -Dm644 "raptrtrackr.desktop" "${pkgdir}/usr/share/applications/raptrtrackr.desktop"
  install -Dm644 "icon-32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/raptrtrackr.png"
}

