# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: piggy1983 <piggy1983@163.com>

pkgname=vtk-doc
pkgver=6.1.0
pkgrel=1
pkgdesc="The documentation of VTK"
arch=(any)
url=('http://www.vtk.org')
license=('BSD')
source=("http://www.vtk.org/files/release/6.1/vtkDocHtml-$pkgver.tar.gz")
md5sums=('e767afa1f5b6f2d74595a434e0498a73')


package() {
	cd $srcdir/

	INSTALLDIR=/usr/share/doc
	mkdir -p $pkgdir$INSTALLDIR
	mv    html     $pkgdir$INSTALLDIR/vtk
}
