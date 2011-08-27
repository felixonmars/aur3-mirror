# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=xml2rfc
pkgver=1.36
pkgrel=1
pkgdesc="A tool to convert an RFC from XML to text, HTML and other formats."
arch=('i686' 'x86_64')
url="http://xml.resource.org/"
license=('custom')
depends=('tk>=8')
source=("http://xml.resource.org/authoring/xml2rfc.tgz")
md5sums=('f96aa187e2ef86affe2843b556556b60')

build() {
	cd $srcdir/$pkgname-$pkgver
	ln -s xml2rfc.tcl xml2txt
	ln -s xml2rfc.tcl xml2html
	ln -s xml2rfc.tcl xml2nroff
	ln -s xml2rfc.tcl xml2npg
	mkdir -p $pkgdir/usr/bin/
	install -m755 xml2rfc.tcl xml2txt xml2html xml2nroff xml2npg $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
