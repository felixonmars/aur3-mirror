# Contributor: Eric Forgeot < http://ifiction.free.fr >
# Maintainer: James Thomas <dairy_water at yahoo dot co dot uk>
pkgname=epubcheck
pkgver=3.0.1
pkgrel=2
pkgdesc="A tool to validate IDPF Epub files."
arch=(any)
url="https://github.com/IDPF/epubcheck"
license=('BSD')
depends=('java-environment')
makedepends=('gzip')
groups=(inform)
source=(https://github.com/IDPF/epubcheck/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip)

md5sums=('701213b3dff0316755c2e2e748f29f4f')

package() {
    mkdir -p $pkgdir/usr/share/${pkgname}
    mkdir -p $pkgdir/usr/bin
    
    cp -fr $srcdir/${pkgname}-${pkgver}/* $pkgdir/usr/share/${pkgname} 
	mv $pkgdir/usr/share/${pkgname}/${pkgname}-${pkgver}.jar $pkgdir/usr/share/${pkgname}/${pkgname}.jar
	
    echo "java -jar /usr/share/epubcheck/epubcheck.jar \"\$1\"" > $pkgdir/usr/bin/${pkgname}
	
    chmod +x $pkgdir/usr/bin/${pkgname}
  
    install -D -m0644 $pkgdir/usr/share/epubcheck/licenses/BSD-3-Clause.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}







