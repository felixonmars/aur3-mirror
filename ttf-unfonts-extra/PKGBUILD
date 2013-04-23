# Contributor: Wolfwood <wolfwood.thg@gmail.com>

pkgname=ttf-unfonts-extra
pkgver=1.0.2
pkgrel=6
pkgdesc="This is a set of Korean TrueType fonts. These fonts were made from the HLaTeX's PostScript fonts and modified slightly."
arch=('any')
license=('GPL')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/f/fonts-unfonts-extra/fonts-unfonts-extra_1.0.3.is.1.0.2-080608.orig.tar.xz")
url="http://kldp.net/projects/unfonts/"
install="ttf.install"
md5sums=('195b5dee3b1f168b897b024b9f244668')

build() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${srcdir}/un-fonts/Un*.ttf ${pkgdir}/usr/share/fonts/TTF/
}

