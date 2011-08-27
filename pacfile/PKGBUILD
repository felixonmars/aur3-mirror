# Author: Peter Morris
# patched by tuxce
# Contributor: tuxce <tuxce.net@gmail.com>
# Maintainer: tuxce <tuxce.net@gmail.com>

pkgname=pacfile
pkgver=0.4
pkgrel=1
pkgdesc="A utility for discovering which ArchLinux package contains a given file."
url="http://threadstates.com/pac_file___an_archlinux_version_of_debian_s_apt_file.html" 
license=('GPL')
depends=('bash') 
arch=('i686' 'x86_64')
install=pacfile.install
source=($pkgname)
md5sums=('980be1b3afa34c53aac7e167f7b08512')

build() { 
	cd "$startdir/src"
	install -d "$startdir/pkg/usr/bin/"
	install -m 755 "$pkgname" "$startdir/pkg/usr/bin/pacfile"
}
