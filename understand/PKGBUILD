# Contributor: Aaron Chen < nextAaron at gmail dot com >

pkgname=understand
_pkgname=Understand
pkgver=3.1.677
pkgrel=1
pkgdesc="Understand from Scientific Toolworks, Inc. is a static analysis tool for maintaining, measuring, & analyzing critical or large code bases."
arch=("i686" "x86_64")
url="http://www.scitools.com"
license=(custom)
depends=()
conflicts=()
options=('!strip' '!upx')

_source_arch="32"
[ "$CARCH" = "x86_64" ] && _source_arch="64"

sha256sums=('5d3131f47142f27d1eb3de08d4a6ed27169c3148073f570e9aec31625f7c48f6')
[ "$CARCH" = "x86_64" ] && 
sha256sums=('1a55e211b08899082645c6a097a00befd194a36ec11db3afb23ef55cb254e62a')

source=("http://scitools.com/download/latest/${_pkgname}/${_pkgname}-${pkgver}-Linux-${_source_arch}bit.tgz")

package() {
	dirname="scitools"
	install -d "$pkgdir/opt"
	mv "$srcdir/$dirname" "$pkgdir/opt/"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$dirname/bin/linux${_source_arch}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
	ln -s "/opt/$dirname/bin/linux${_source_arch}/understand.bin" "$pkgdir/usr/bin/${pkgname}.bin"

}
