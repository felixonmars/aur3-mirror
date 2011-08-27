# Maintainer: Olivier Médoc <o_medoc@yahoo.fr>
# Contributor: 

pkgname=libtimidity
pkgver=0.1.0
pkgrel=1
pkgdesc="libTiMidity is a MIDI to WAVE converter library that uses Gravis Ultrasound-compatible patch files to generate digital audio data from General MIDI files."
arch=('i686' 'x86_64')
url="http://libtimidity.sourceforge.net"
license=('GPLv3')
depends=()
makedepends=()
install=libtimidity.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-${pkgver}.tar.bz2)
md5sums=('72173a1084df0c42f9daa7b4568ebd18')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
