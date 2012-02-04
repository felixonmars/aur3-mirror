# Maintainer: FzerorubigD <fzerorubigd {AT} Gmail {Dot} Com
# Contributor: Romain Labolle <ravomavian@gmail.com>

arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')

pkgname=bluegriffon-nightly
pkgdesc='The next-generation Web Editor'
url='http://bluegriffon.org/'
pkgver=0.8.1
pkgrel=2

source=( 'bluegriffon-nightly.desktop' )
md5sums=('b9c6663009a24e62b085cfdfd15f8457')
sha1sums=('2f0d851ea3a73414b71dd957191623a0b08e2c71')

depends=( 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info' )
makedepends=('wget')

build() {
	cd ${srcdir}
	BG_SRC="bluegriffon-kubuntu-32.tar.bz2"
	if [[ "$CARCH" == "x86_64" ]];then
		BG_SRC="BlueGriffon-${pkgver}-Linux-x86_64.tar.bz2"
	else
		BG_SRC="BlueGriffon-${pkgver}-Linux-x86.tar.bz2"
	fi
	BG_SRC_URI="http://bluegriffon.org/freshmeat/nightlies/latest/${BG_SRC}"

	msg "Downloading..."
	cd ..
	wget -c ${BG_SRC_URI} || return 1
	msg "Extracting..."
	cd ${srcdir}
	bsdtar -x -f ../${BG_SRC} || return 1
	msg "Packaging..."

	mkdir -p ${pkgdir}/{usr/{bin,share/{applications,pixmaps}},opt} || return 1
	cp -R BlueGriffon ${pkgdir}/opt/${pkgname} || return 1

	ln -s /opt/${pkgname}/bluegriffon ${pkgdir}/usr/bin/${pkgname} || return 1
	install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/ || return 1
	install -m644 ${srcdir}/BlueGriffon/chrome/icons/default/default48.png ${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png || return 1
}

