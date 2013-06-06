# Maintainer: dale mallion <dale.mallion@gmail.com>
pkgname=mac-os-x-theme
pkgver=3.6
pkgrel=2
pkgdesc="GNOME 3.6 compatible MAC OS X Theme by noobslab"
url="http://www.noobslab.com"
arch=('any')
license=('unknown')
source=('https://launchpad.net/~noobslab/+archive/themes/+files/mac-os-x-theme_3.6~precise.tar.gz')
build() {
  cd "$srcdir/mac-theme"
  mkdir -p "${pkgdir}"/usr/share/themes

  cp -rf $pkgname "${pkgdir}"/usr/share/themes/

  chmod 755 -R "$pkgdir/usr/share/themes"
}
md5sums=('bf611bcefd763c1e31d34d9367a5c4d1')
