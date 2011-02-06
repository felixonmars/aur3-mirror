# Contributor: Prurigro
# Maintainer: Prurigro

pkgname=basiliskii
pkgver=22032005
pkgrel=1
pkgdesc="An Open Source 680x0 Macintosh emulator developed by Christian Bauer"
url="http://gwenole.beauchesne.online.fr/basilisk2/downloads.html"
license="GPL"
depends=('gtk2')
arch=('i686' 'x86_64')
source=(http://gwenole.beauchesne.online.fr/basilisk2/files/BasiliskII_src_"$pkgver".tar.bz2
	sys_unix.cpp.patch)
md5sums=('10b062f03676c34f5092fd72d5aa7547'
	 'fc026b5cfbb38d5d53accde70f4c0101')

build() {
  pushd "$srcdir"/BasiliskII-1.0/src/Unix || return 1
  	patch -p0 < "$startdir"/src/sys_unix.cpp.patch || return 1
  	./configure --prefix=/usr || return 1
  	make || return 1
  	make DESTDIR="$startdir"/pkg install || return 1
  popd || return 1
}
