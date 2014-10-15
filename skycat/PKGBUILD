pkgname=skycat
pkgrel=1
pkgver=3.1.2
pkgdesc="ESO Skycat Tool"
arch=('i686' 'x86_64')
url="http://archive.eso.org/cms/tools-documentation/skycat.html"
license=('GPL')
depends=("tcl" "tk")
source=(http://archive.eso.org/cms/tools-documentation/skycat-download/skycat-${pkgver}-Ubuntu14.tar.gz)
sha256sums=('1ad1185d136dfb64b65b2e2c785364e785615e64b96b596419f9390d92ef4262')

package() {
	cd $srcdir
	install -d -m755 "$pkgdir/usr/"
	cp -r "$srcdir/usr/" "$pkgdir"
}
