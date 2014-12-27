pkgname=fanurio-beta
pkgver=3.1
betaver=4
pkgrel=1
pkgdesc="Fanurio time tracking service"
arch=('i686' 'x86_64')
url="http://www.fanuriotimetracking.com"
license=('EULA')
depends=('java-runtime')
conflicts=('fanurio')
source=("http://www.fanuriotimetracking.com/files/releases/${pkgver}-beta${betaver}/fanurio_${pkgver}~beta${betaver}_all.deb")

md5sums=('dcf7c2aa766b1385b89a927fa7627617')


package() {
    tar -zxf data.tar.gz -C "${pkgdir}"
}
