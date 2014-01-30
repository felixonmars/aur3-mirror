# Maintainer: Helge Rausch <helge@rausch.io>
# This script is licensed under the MIT license.
# https://gist.github.com/tsujigiri/5476281
#
## Installation
#
# To install the Leap software, you first need to download the SDK for Linux
# from https://developer.leapmotion.com/downloads/leap-motion/sdk using your
# developer account. Unpack it, place the included .deb files in the same
# directory as this PKGBUILD and run `makepkg`. If all goes well this will
# create a package file, which can be installed by running:
#
#   pacman -U leap-1.0.9+8411-x86_64.pkg.tar.xz
#
# or
#
#   pacman -U leap-1.0.9+8411-i686.pkg.tar.xz
#
# depending on your architecture.
#
pkgname=leap
pkgver=1.0.9+8411
pkgrel=1
pkgdesc="Installs the Debian package from the Leap SDK to Arch Linux"
arch=('i686' 'x86_64')
url="https://developer.leapmotion.com/downloads/leap-motion/sdk"
depends=('mesa' 'libxxf86vm')
license=('unknown')

case $CARCH in
	'x86_64')
		_arch='x64'
		md5sums=('01b7fc72dfd55148f986b386aa236eb9')
		;;
	'i686')
		_arch='x86'
		md5sums=('365a0ad1af187ade50d11e845f5539de')
		;;
esac

source=("Leap-${pkgver}-${_arch}.deb")

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}
