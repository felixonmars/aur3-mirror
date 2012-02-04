# Contributor: Stefano Pompa <stefano.pompa@gmail.com>
pkgname=ttf-bsurfers
pkgver=1.0
pkgrel=1
pkgdesc='B Surfers True Type Font'
arch=('i686' 'x86_64')
license=('custom')
url='http://font.html.it'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('unzip')
install='ttf-font.install'
source=('http://dwb.html.it/font/B_Surfers.zip')

build() {
	cd ${startdir}/src
	mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
	install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}

md5sums=('ed872324baf5e3339d6aaa95452226db')

