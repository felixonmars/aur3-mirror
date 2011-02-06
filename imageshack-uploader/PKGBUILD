# Contributor: fr0stb1te <fbt@fr0stb1te.ru>
# Credits: a2k

pkgname=imageshack-uploader
_realname=imageshack-uploader
pkgver=2.2.0
pkgrel=2
pkgdesc="A simple application for uploading one or more images and/or videos to ImageShack web services."
arch=('i686')
url="http://toolbar.imageshack.us/windows-uploader/download.php"
license=('BSD')
[ "${CARCH}" == "i686" ] && depends=('ffmpeg' 'qt')
provides=(${_realname})
conflicts=(${_realname})
source=("http://toolbar.imageshack.us/windows-uploader/imageshack-uploader-${pkgver}.deb")
md5sums=('d5ca7985aaae3c51800e21b7ac2d95e3')

build() {

	cd $srcdir

	ar x imageshack-uploader-${pkgver}.deb
	bsdtar xf data.tar.gz -C $pkgdir

}
