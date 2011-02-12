# Maintainer: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>
pkgname=mixcloud-dl
pkgver=1.1
pkgrel=1
pkgdesc="A small command-line program to download music from mixcloud.com"
arch=('any')
url="https://github.com/jordidg/mixcloud-dl"
license=('GPL')
depends=('aria2' 'mp3info' 'python')
source=("https://github.com/jordidg/${pkgname}/raw/${pkgver}/mixcloud_dl.py")
md5sums=('6172579fbe824df2b3a0ad1f54c723ef')

package() {
  install -D "${srcdir}"/mixcloud_dl.py "${pkgdir}"/usr/bin/mixcloud-dl
} 
