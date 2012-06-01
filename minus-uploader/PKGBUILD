# Maintainer: Ethan Best <me@ethanbest.info>

pkgname="minus-uploader"
pkgver="1.8"
pkgrel=0
pkgdesc="Desktop app that allows you to drag-n-drop files into the taskbar and instantly upload to Minus"
url="https://minus.com/pages/tools"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('binutils' 'tar')
depends=('qt' 'qjson')

if [ "${CARCH}" == 'x86_64' ]; then
	
	_debarch='amd64'
	
elif [ "${CARCH}" == 'i686' ]; then
	
	_debarch='i386'
	
fi

_sourcefile="minus-desktop-tool_${_debarch}.deb"
source=("http://blog.minus.com/updates/${_sourcefile}")

[ "${CARCH}" == 'x86_64' ] && md5sums=('8202eec862486e0d776990a3302b60e5')
[ "${CARCH}" == 'i686' ] && md5sums=('a916dc057f77ae08e1e82fc72da383db')

build() {
	
	true
	
}

package() {

	cd ${srcdir}/
	ar -p ${_sourcefile} data.tar.gz | tar zxf - -C "${pkgdir}" || return 1

}
