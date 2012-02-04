# Contributor: Jose Illescas Perez <yoburtu at gmail dot com>

pkgname="libtowitoko2"
pkgver="2.0.7"
pkgrel=2
debrel=7.3
pkgdesc="Towitoko smartcard reader PCSC and CT-API driver."
arch=('i686' 'x86_64')
url="http://packages.debian.org/lenny/libtowitoko2"
license=('GPL')
depends=('pcsclite')
makedepends=('make')

if [ "$CARCH" = "i686" ]; then
	debarch=("i386")
	source=("http://ftp.us.debian.org/debian/pool/main/t/towitoko/libtowitoko2_${pkgver}-${debrel}_${debarch}.deb")
	md5sums=('9a7b201c37b7fbfa9056f2e08bb941d8')
	sha256sums=('56805046592bee8b008b46fd48eef4a1a5d1861f178cd139d720b8982b374bfa')
fi

if [ "$CARCH" = "x86_64" ]; then
	debarch=("amd64")
	source=("http://ftp.us.debian.org/debian/pool/main/t/towitoko/libtowitoko2_${pkgver}-${debrel}_${debarch}.deb")
	md5sums=('4f2fc317205da7a8ad564e179a92d232')
	sha256sums=('958f31690746d7a24db5dc0b461ba078d37d838fe0225d68eccc7065a59e53c7')
fi

build()
{
	cd ${startdir}/src
	ar x libtowitoko2_${pkgver}-${debrel}_${debarch}.deb
	tar -zxf data.tar.gz
	mkdir ${startdir}/pkg/usr
	cp -r usr ${startdir}/pkg/
}	

