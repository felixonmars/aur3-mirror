# Maintainer: Kristian Villalobos <villalobos.kristian@gmail.com>

pkgname=quickrex
pkgver=3.5.0
pkgrel=1
pkgdesc='QuickREx is a regular-expression plugin for Eclipse'
arch=('any')
url='http://sourceforge.net/projects/quickrex/'
license=('EPL')
depends=('eclipse')
source=("http://downloads.sourceforge.net/project/quickrex/QuickREx%20Plug-In/Version%203.5.0/QuickREx_$pkgver.jar")
md5sums=('624cc8154acbf6a5d64ab19f7a95d650')

package() {
  d="$pkgdir/usr/share/eclipse/dropins/quickrex/eclipse/plugins"
  install -d "$d"
  cp QuickREx_$pkgver.jar "$d"
}
