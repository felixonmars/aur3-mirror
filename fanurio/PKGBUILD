pkgname=fanurio
pkgver=3.0.1
pkgrel=1
pkgdesc="Fanurio time tracking service"
arch=('i686' 'x86_64')
url="http://www.fanuriotimetracking.com"
license=('EULA')
depends=('java-runtime')
source=("http://www.fanuriotimetracking.com/files/releases/${pkgver}/${pkgname}_${pkgver}_all.deb")
md5sums=('21bff06179545085fe12257a40d1bcc8')


package() {
    tar -zxf data.tar.gz -C "${pkgdir}"
}
