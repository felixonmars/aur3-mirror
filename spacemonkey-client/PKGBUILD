# Maintainer: Valentin Churavy <v.churavy@gmail.com>
# This script is licensed under the MIT license.
# and based upon https://gist.github.com/tsujigiri/5476281
#
pkgname=spacemonkey-client
pkgver=2014.01.29
pkgrel=1
pkgdesc="Installs the Debian package for Spacemonkey to Arch Linux"
arch=('i686' 'x86_64')
url="http://alpha-support.spacemonkey.com/desktop-apps/linux"
depends=('fuse')
license=('unknown')
 
case $CARCH in
	'x86_64')
		_arch='amd64'
		md5sums=('88bb61b7858c807b8e21224f9b6d958f')
		;;
	'i686')
		_arch='i386'
		md5sums=('b7f8ce9a6ae4df6332952dc5d6449519')
		;;
esac
 
source=("http://apt.spacemonkey.com/client/pool/main/s/${pkgname}/${pkgname}_${pkgver}-${pkgrel}.wheezy_${_arch}.deb")
 
package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
}