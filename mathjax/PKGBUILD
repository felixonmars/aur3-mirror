# Maintainer: Kevin Dodd <jesin00@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=mathjax
_pkgver=2.5
pkgver=2.5.1
pkgrel=1
pkgdesc='An open source JavaScript display engine for mathematics that works in all modern browsers'
url='https://www.mathjax.org/'
arch=(any)
license=(Apache)
provides=(otf-stix)
install=mathjax.install
options=(!strip libtool staticlibs)
source=("https://github.com/mathjax/MathJax/archive/v$_pkgver-latest.tar.gz")
sha256sums=('e3e4b295b27408a4d737e04242ca6b39e115fab57b1e44fd3d66fd48ff0b08d4')

package() {
	mkdir -pm755 "$pkgdir/usr/share/licenses/mathjax"
	cd "$pkgdir/usr/share"
	mkdir -m755 fonts javascript
	cp -a "$srcdir/MathJax-$_pkgver-latest" javascript/mathjax
	mv javascript/mathjax/fonts fonts/mathjax
	ln -s '../../fonts/mathjax' javascript/mathjax/fonts
	ln -s '../../javascript/mathjax/LICENSE' licenses/mathjax/LICENSE

	# Certain AUR packages depend on the mathjax files existing at
	# /usr/share/mathjax so we have to make this symlink.
	# It might be removed after those packages are updated.
	ln -s 'javascript/mathjax' .
}
