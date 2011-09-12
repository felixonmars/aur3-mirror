# Maintainer: Maskawanian <aur@cryingwolf.org>
pkgname=alac2flac
pkgver=2009.04.25
pkgrel=4
pkgdesc="Script to convert ALAC to FLAC."
arch=(any)
depends=('php' 'libmp4v2' 'mplayer' 'flac')
license=('custom:cc-by-nc-sa')
url=('http://www.slello.com')
source=(alac2flac)
md5sums=('912f192474b3795fe8e5c4d49d7d1447')

build() {
cd ${startdir}/pkg || return 1
mkdir -p usr/bin || return 1
cd usr/bin || return 1
cp ${startdir}/alac2flac .
chmod +x alac2flac
}
