# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Carlo Casta <carlo.casta at gmail dot com>

pkgname=lib3ds
pkgver=1.3.0
pkgrel=1
pkgdesc="A library for managing 3D-Studio Release 3 and 4 '.3DS' files"
arch=('i686' 'x86_64')
url="http://code.google.com/p/lib3ds"
license=('LGPL')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.zip)
options=('!libtool')
md5sums=('2572f7b0f29b591d494c1a0658b35c86')

build() {
    cd "${srcdir}"/$pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}"/$pkgname-$pkgver
    make DESTDIR="${pkgdir}" install 
}
    
