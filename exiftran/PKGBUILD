# Contributor: David Sotelo <dvsotelo at gmail.com>

pkgname=exiftran
pkgver=2.07
pkgrel=7
pkgdesc="Command line tool to do lossless transformations of JPEG images."
arch=('i686' 'x86_64')
url="http://linux.bytesex.org/fbida/"
license=('GPL2')
depends=('libexif' 'libjpeg')
conflicts=('fbida')
source=("http://dl.bytesex.org/releases/fbida/fbida-$pkgver.tar.gz"
        'libpng-1.4.patch'
        'libjpeg-8.patch')
md5sums=('3e05910fb7c1d9b2bd3e272d96db069c'
         '31b5a5318c16808d55403e06110ff5a5'
         'e647584600dd35f035f3053183f39dc0')


prepare() {
 cd "fbida-$pkgver"
 rm jpeg/jpeg{int,lib}.h
 patch -p1 < ../libpng-1.4.patch
 patch -p1 < ../libjpeg-8.patch
 make clean
}

build() {
 cd "fbida-$pkgver"
 make
}

package() {
 cd "fbida-$pkgver"
 install -Dm755 exiftran "$pkgdir/usr/bin/exiftran"
 install -Dm644 exiftran.man "$pkgdir/usr/share/man/man1/exiftran.1"
}
