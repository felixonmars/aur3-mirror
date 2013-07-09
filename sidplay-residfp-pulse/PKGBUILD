# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Jonas Nyrén <jonas.nyren*mindkiller.com>

pkgname=sidplay-residfp-pulse
pkgver=1.0.3
pkgrel=1
pkgdesc="Sidplay2 fork with improved filter emulation (Pulseaudio only)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sidplay-residfp/"
license=('GPL')
depends=('libsidplayfp>=1.0.3' 'pulseaudio')
replaces=('sidplay-residfp')
conflicts=('sidplay-residfp' 'sidplay-residfp-alsa')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/sidplay-residfp/sidplayfp/1.0/sidplayfp-${pkgver}.tar.gz")
sha256sums=('c8756ea4d56c3533be6d1b226e21b236909028e1c94700ddc5f2a9cc70a9b226')

build() {
  cd ${srcdir}/sidplayfp-${pkgver}

  ./configure --prefix=/usr --mandir=/usr/man --enable-driver=pulse
  make
}

package() {
  cd sidplayfp-${pkgver}
  make DESTDIR="${pkgdir}" install
}

