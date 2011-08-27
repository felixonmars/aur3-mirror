pkgname=covertagger
pkgver=1.01
pkgrel=1
pkgdesc="Add and remove cover images from your mp3s"
url="http://www.musaraigne.net/covertagger/"
license=("GPL")
arch=("i686" "x86_64")
depends=("taglib" "openssl")
source=(http://www.musaraigne.net/covertagger/${pkgname}-src-${pkgver}.tar.gz)
md5sums=("814baeb600e5e59398564d18a488913b")

build() {
    mkdir -p ${startdir}/src/
	cd ${startdir}/src/

	msg "Starting build process."
    make || return 1
    mkdir -p ${startdir}/pkg/usr/bin
    cp -v ${startdir}/src/covertagger ${startdir}/pkg/usr/bin
}
