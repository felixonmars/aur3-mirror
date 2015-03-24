# Maintainer: Goekcen Eraslan <gokcen.eraslan@gmail.com>
pkgname=h2oai
pkgver=2.8.6.2
pkgrel=1
pkgdesc="Open source big data analysis tool"
arch=('any')
url="http://h2o.ai/"
license=('Apache')
depends=(java-runtime systemd)
makedepends=()
checkdepends=()
optdepends=()
backup=('etc/conf.d/h2oai')
source=("http://h2o-release.s3.amazonaws.com/h2o/rel-nunes/2/h2o-$pkgver.zip"
        'h2oai.service'
        'h2oai.conf.d')
sha256sums=('ea3b4e755cb193196f1c261282304fbf67e3c35a4e436a0b5bbdf1905cf128d8'
            '71ca1a5885f6b811d17b3176f7d47cbdda2856da502f4d7a4ca904e8544457aa'
            '1aad2bc611eefd253bf261b27ddd487110c54fb95f77239e71681680d03f0325')
install='h2oai.install'

package() {
	cd "h2o-$pkgver"
	JAVA_DIR="$pkgdir/usr/share/java/h2o"
	install -d $JAVA_DIR
	install -m 644 h2o.jar $JAVA_DIR

	install -dm 755 "${pkgdir}"/usr/lib/systemd/system
	install -m 644 ${srcdir}/h2oai.service "${pkgdir}"/usr/lib/systemd/system/

	install -d $pkgdir/etc/conf.d
	install -m 644 ${srcdir}/h2oai.conf.d "${pkgdir}"/etc/conf.d/h2oai
}
