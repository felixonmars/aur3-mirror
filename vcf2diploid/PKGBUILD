# Install CNVnator from the Gernstein lab

# Maintainer: Mike Dacre <mike.dacre@gmail.com>
pkgname=vcf2diploid
pkgver=v0.2.6a
pkgrel=1
pkgdesc="Install vcf2diploid (aka Personal Genome Constructor) from the Gerstein lab"
arch=('x86_64' 'i686')
url="http://alleleseq.gersteinlab.org/tools.html"
license=('CCPL' 'cc-by-nc')
depends=('jre7-openjdk-headless')
source=("http://alleleseq.gersteinlab.org/${pkgname}_${pkgver}.zip"
        'vcf2diploid.sh')
md5sums=('d6412078b603d14750c760f920f1f661'
         '0a24692e2507f05fe5808417c3217c4c')
 
build() {
	cd "$srcdir/${pkgname}_${pkgver}"
	make
}

package() {
  mkdir -p "$pkgdir/bin/"
  mkdir -p "$pkgdir/usr/share/${pkgname}/"
  mkdir -p "$pkgdir/usr/share/java/${pkgname}/"
  install -m644 "$srcdir/${pkgname}_${pkgver}/${pkgname}.jar" "$pkgdir/usr/share/java/${pkgname}/"
  cp -r "$srcdir/${pkgname}_${pkgver}/example" "$pkgdir/usr/share/${pkgname}/example"
  install -m755 "$srcdir/${pkgname}.sh" "$pkgdir/bin/${pkgname}"
}
