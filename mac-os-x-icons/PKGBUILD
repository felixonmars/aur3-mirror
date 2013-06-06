# Maintainer: Wei Qiu <wei@qiu.es>
# Contributor: dale mallion <dale.mallion@gmail.com>
pkgname=mac-os-x-icons
pkgver=3.6
pkgrel=2
pkgdesc="Gnome 3.6 compatible MAC OS X Lion Icon Theme by noobslab"
arch=('any')
url="http://www.noobslab.com/"
license=('unknown')
source=('https://launchpad.net/~noobslab/+archive/themes/+files/mac-os-x-icons_3.6.5~precise~NoobsLab.com.tar.gz')
build() {
  cd "$srcdir/mac-icons"
  mkdir -p "${pkgdir}"/usr/share/icons

  cp -rf $pkgname "${pkgdir}"/usr/share/icons/

  chmod 755 -R "$pkgdir"/usr/share/icons
}
md5sums=('a83d33dd67174c5d165227acfa9a5a4d')
