# Contributor: Wolfwood <wolfwood.thg@gmail.com>

pkgname=ttf-unfonts-core
pkgver=1.0.2
pkgrel=6
pkgdesc="This is a set of Korean TrueType fonts. These fonts were made from the HLaTeX's PostScript fonts and modified slightly."
arch=('any')
license=('GPL')
source=("http://archive.ubuntu.com/ubuntu/pool/main/f/fonts-unfonts-core/fonts-unfonts-core_1.0.3.is.1.0.2-080608.orig.tar.xz")
url="http://packages.ubuntu.com/fr/precise/ttf-unfonts-core"
install="ttf.install"
md5sums=('8ca6e769d98b5af4a11228929da8bb99')

build() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${srcdir}/un-fonts-1.0.2-080608.orig/Un*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

