# Maintainer: Ian Glen <ian@ianglen.me> 

pkgname=plank-theme-transparent
pkgver=0.1
pkgrel=1
pkgdesc='Transparent theme for plank'
arch=('any')
url='http://1inux.deviantart.com/art/Transparent-for-Plank-319745532'
license=('custom')
depends=('plank')
source=("https://dl.dropboxusercontent.com/u/11964612/plank-theme-transparent/plank-theme-transparent.tar.gz")
sha256sums=('c07616b492566db4320027bf04cfccd9179cacc8fbf842bd7547288354006498')

package() {
  install -dm 755 "${pkgdir}"/usr/share/plank/themes/
  cp -dr --no-preserve='ownership' Transparent "${pkgdir}"/usr/share/plank/themes/
}