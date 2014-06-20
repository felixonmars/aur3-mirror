# Maintainer: Ryan Mitchell <rymitch[at]gmail[dot]com>
pkgname=sourcegear-diffmerge
pkgver=4.2.0.697
pkgrel=1
pkgdesc="DiffMerge is an application to visually compare and merge files."
url="http://www.sourcegear.com/diffmerge/"
arch=('x86_64')
license=('custom')
depends=('gtk2' 'libpng15' 'curl')
makedepends=('rpmextract')
source=('http://download-us.sourcegear.com/DiffMerge/4.2.0/diffmerge-4.2.0.697.stable-1.x86_64.rpm')
md5sums=('230a8ce57ae5ef88f79113ceb39b839f')

build() {
echo "Entering " ${srcdir}
cd "${srcdir}"
echo "Extracting archive"
rpmextract.sh diffmerge-$pkgver.stable-1.x86_64.rpm
}

package() {
echo "Performing install"
cd "${srcdir}"
install -Dm755 usr/bin/diffmerge ${pkgdir}/usr/bin/diffmerge
install -Dm644 usr/share/pixmaps/sourcegearcom-diffmerge.png ${pkgdir}/usr/share/pixmaps/sourcegearcom-diffmerge.png
install -Dm644 usr/share/man/man1/diffmerge.1.gz ${pkgdir}/usr/share/man/man1/diffmerge.1.gz
install -Dm644 usr/share/applications/sourcegear.com-diffmerge.desktop ${pkgdir}/usr/share/applications/sourcegear.com-diffmerge.desktop

install -Dm644 usr/share/doc/diffmerge-$pkgver.stable/DiffMergeManual.pdf ${pkgdir}/usr/share/doc/${pkgname}/DiffMergeManual.pdf

install -Dm644 usr/share/doc/diffmerge-$pkgver.stable/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
install -Dm644 usr/share/doc/diffmerge-$pkgver.stable/Readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/Readme.txt
}
