# Maintainer:	Benjamin van der Burgh <benjaminvdb@gmail.com>
# Contributor:  Pieter Verschueren <pieter.verschueren@gmail.com>

pkgname=spotlite
pkgver=2.0.0
pkgrel=4
pkgdesc="Lightweight version of the Spotnet usenet spot database."
url="http://www.spot-net.nl/spotlite/"
license=('custom')
makedepends=('')
arch=('i686' 'x86_64')
depends=('qt' 'qtwebkit' 'openssl')
source=('http://www.spot-net.nl.vfcdn.net/downloads/spotlite/SpotLite(v2)Ubuntu.zip'
	'SpotLite')
md5sums=('095d2c11fad5e49ddd965d24d033dc71'
	 '5487b3488e1ca4efa8d98e86ca9461f5')
optdepends=()

build() {

if [ "$CARCH" = "i686" ]; then
	ar x spotlite-i386.deb
elif [ "$CARCH" = "x86_64" ]; then
	ar x spotlite-amd64.deb
fi

tar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

# Some components cannot be installed since they are hardcoded to read 
# from /usr/local in which we cannot install. See Package Etiquette:
# https://wiki.archlinux.org/index.php/Arch_Packaging_Standards#Package_etiquette
rm -rf ${pkgdir}/usr/bin/SpotLite-skininstaller
rm -rf ${pkgdir}/usr/local
rm -rf ${pkgdir}/usr/share/mime

# SpotLite expects libssl.so.0.9.8, but doesn't work with it.
# Create symlink in a seperate directory as a workaround.
mkdir -p ${pkgdir}/usr/share/spotlite/libs
ln -s /usr/lib/libcrypto.so.1.0.0 ${pkgdir}/usr/share/spotlite/libs/libcrypto.so.0.9.8

# Install script with a custom library path so the symlink is followed, making the
# application use the newer library file.
mv ${pkgdir}/usr/bin/SpotLite ${pkgdir}/usr/share/spotlite/SpotLite
install -Dm 755 ${srcdir}/SpotLite ${pkgdir}/usr/bin/SpotLite
}
