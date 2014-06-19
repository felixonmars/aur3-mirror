# Maintainer:  Eugen Zagorodniy <e dot zagorodniy at gmail dot com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: 4javier <4javiereg4ATgmailDOTcom>
# Contributor: Matti Niemenmaa <matti.niemenmaa+aur, domain iki.fi>

md5sums=('SKIP')
pkgname=simulavr-git
pkgver=c8132a6
pkgrel=1
pkgdesc="Simulator for the Atmel AVR family of 8-bit risc microcontrollers"
url="http://savannah.nongnu.org/projects/simulavr"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ncurses' 'tk' 'tcl')
makedepends=('avr-libc' 'swig1' 'git')
options=('!strip')
source=(
       	git://git.sv.gnu.org/simulavr.git
)
md5sums=('SKIP')
_gitname=simulavr
build() {
    cd ${srcdir}/${_gitname} 
    echo `ls`
    echo `pwd`


    ./bootstrap
    ./configure --prefix=/usr --enable-python=python2.7 --enable-tcl LDFLAGS="-L/usr/lib/python2.7" CPPFLAGS="-I/usr/include/python2.7"
    make
}

package() {
    cd ${srcdir}/${_gitname}
    make install DESTDIR=$pkgdir || return 1
}

