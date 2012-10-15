# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Nathan Hourt <nat.hourt@gmail.com>
pkgname=zbar-bin-64
pkgver=0.10
pkgrel=2
pkgdesc="An open source software suite for reading bar codes from various sources -- 64-bit binary version"
arch=('x86_64')
url="http://zbar.sourceforge.net/"
license=('LGPL')
depends=(imagemagick libxv)
provides=()
source=("http://launchpadlibrarian.net/109859164/zbar-tools_0.10%2Bdoc-7build3_amd64.deb" "http://launchpadlibrarian.net/109859166/libzbar0_0.10%2Bdoc-7build3_amd64.deb")

build() {
  cd "$srcdir/"

  ar x "libzbar0_0.10%2Bdoc-7build3_amd64.deb" data.tar.gz
  tar xf data.tar.gz
  ar x "zbar-tools_0.10%2Bdoc-7build3_amd64.deb" data.tar.gz
  tar xf data.tar.gz

  mv usr "$pkgdir/"
}

md5sums=('5906951f77e5ba429df040ffe8883ea4'
         'a510ba28a7d2d04cc425cd112b2569b4')
