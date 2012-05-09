# Maintainer:  Eugen Zagorodniy <e dot zagorodniy at gmail dot com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: 4javier <4javiereg4ATgmailDOTcom>
# Contributor: Matti Niemenmaa <matti.niemenmaa+aur, domain iki.fi>

pkgname=simulavr
pkgver=1.0.0
pkgrel=3
pkgdesc="Simulator for the Atmel AVR family of 8-bit risc microcontrollers"
url="http://savannah.nongnu.org/projects/simulavr"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ncurses')
makedepends=('avr-libc')
options=('!strip')
source=(
  http://mirror.lihnidos.org/GNU/savannah/simulavr/${pkgname}-${pkgver}.tar.gz
  systemclock.cpp.patch
)
md5sums=('9482c7b221b1056932b7190006aab806'
         '57475fa1a0ac2d4a741ab697416551bd')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    # We need to pass -lz explicitly
    sed -i 2iLIBZ_FLAGS=-lz configure
    # Avoid error
    # /usr/bin/avr-ld: unrecognized option '--hash-style=gnu'
    unset LDFLAGS

    # Avoid error:
    #
    # systemclock.cpp: In instantiation of ‘void MinHeap<Key, Value>::Insert(Key, Value) [with Key = long long int; Value = SimulationMember*]’:
    # systemclock.cpp:135:40:   required from here
    # systemclock.cpp:70:2: error: ‘resize’ was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
    # systemclock.cpp:70:2: note: declarations in dependent base ‘std::vector<std::pair<long long int, SimulationMember*>, std::allocator<std::pair<long long int, SimulationMember*> > >’ are not found by unqualified lookup
    # systemclock.cpp:70:2: note: use ‘this->resize’ instead
    patch -p0 -i ../systemclock.cpp.patch

    ./configure --prefix=/usr --disable-python --disable-tcl
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make install DESTDIR=$pkgdir || return 1
}

