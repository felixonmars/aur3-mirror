# Maintainer: Matt Parnell <parwok@gmail.com>

pkgname=seabios-osx-git
pkgver=51684b7
pkgrel=1
pkgdesc="A 16-bit x86 bios with a patch to enable OS X Guests"
arch=(any)
license=('GPL3' 'LGPL3')
url="http://www.coreboot.org/SeaBIOS"
makedepends=('iasl' 'python2')
source=('git://git.seabios.org/seabios.git'
		'http://www.contrib.andrew.cmu.edu/~somlo/OSXKVM/seabios-mac-20130223.patch')
options=(!strip)
md5sums=('SKIP'
		 'ea3018dc4758e3abdb6220607dc87a93')
provides=('seabios')
conflicts=('seabios')

_gitname="seabios"

prepare() {
	cd "${srcdir}/$_gitname"
	patch -Np1 -i "${srcdir}/seabios-mac-20130223.patch" || return 1
}

pkgver() {
	cd "${srcdir}/$_gitname"
	git describe --always | sed 's|-|.|g'
}

build()
{
    cd "${srcdir}/$_gitname"
    sed -i -e 's/python/python2/g' Makefile
    make
}

package()
{
    install -D -m644  "${srcdir}/$_gitname/out/bios.bin" "${pkgdir}/usr/share/qemu/bios.bin"
}

