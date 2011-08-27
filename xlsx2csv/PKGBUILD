# Contributer: ormris ormris@ormris.com
pkgname=xlsx2csv
pkgver=1.2
pkgrel=1
pkgdesc="XLSX to CSV converter by Kirk Roybal"
arch=('i686' 'x86_64')
url="http://kirk.webfinish.com"
license=('GPL')
depends=('libxslt' 'unzip' 'coreutils' 'libxml' 'sqlite3' 'sed')
source=("http://kirk.webfinish.com/xlsx2csv/$pkgname-$pkgver.tar.gz")
md5sums=('46735abccbcab2669eff465e50177e6f')
package() {
    mv ${pkgname}.sh ${pkgname}
    mkdir -p "${pkgdir}/usr/bin/"
    install -m755 ${pkgname} "${pkgdir}/usr/bin/"
}
