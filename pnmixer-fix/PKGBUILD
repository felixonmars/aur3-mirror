# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: qvx  <qvx@archlinux>
# Contributor: Nick Lanham <nick@nick>
pkgname=pnmixer-fix
_pkgname=pnmixer
pkgver=0.5.1
pkgrel=2
pkgdesc="pnmixer with patch from qvx"
arch=('i686' 'x86_64' 'arm')
license=('GPL')
url="https://github.com/nicklan/pnmixer"
groups=('pnmixer')
depends=('gtk2' 'alsa-lib')
source=(https://github.com/downloads/nicklan/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
 http://aur-includes.googlecode.com/git/${pkgname}/pnmixer-0.5.1-configure.in.patch)
md5sums=('2288af95ab280721b39b7c33601d5dd4' '57b4d37c2d61f426bbf8ec97e7d45874')

build() {
 cd "${srcdir}/${_pkgname}-${pkgver}"
 patch -Np0 -i ../pnmixer-0.5.1-configure.in.patch
 ./autogen.sh
 ./configure --prefix=/usr
 make
 make DESTDIR="$pkgdir" install
} 
