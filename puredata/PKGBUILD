# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=puredata
pkgver=0.43_0
pkgrel=1
pkgdesc="The Pure Data real-time music and multimedia environment"
arch=('i686' 'x86_64')
url="http://crca.ucsd.edu/~msp/software.html"
license=('BSD' 'GPL')
depends=('jack' 'tk')
optdepends=('pd-arraysize:'
			'pd-boids:'
			'pd-bsaylor:'
			'pd-creb:'
			'pd-cyclone:'
			'pd-ekext:'
			'pd-ext13:'
			'pd-freeverb:'
			'pd-gem:'
			'pd-ggee:'
			'pd-gridflow:'
			'pd-hid:'
			'pd-jmmmp:'
			'pd-ladspa:'
			'pd-list-abs:'
			'pd-mapping:'
			'pd-motex:'
			'pd-pdogg:'
			'pd-pdp:'
			'pd-plugin:'
			'pd-pmpd:'
			'pd-purepd:'
			'pd-sigpack:'
			'pd-smlib:'
			'pd-vbap:'
			'pd-windowing:'
			'pd-zexy:')

source=(http://crca.ucsd.edu/~msp/Software/pd-${pkgver/_/-}.src.tar.gz)


build() {
  cd "$srcdir/pd-${pkgver/_/-}/src"
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-alsa --enable-jack
  make
}

package() {
  cd "$srcdir/pd-${pkgver/_/-}/src"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/pd/LICENSE"

  # @bug http://comments.gmane.org/gmane.comp.multimedia.puredata.devel/9482
  install -dm755 "$pkgdir/usr/lib/pd/tcl"
  install -m644 ../tcl/* "$pkgdir/usr/lib/pd/tcl"
}

md5sums=('b7e7bab14220146748c2ed596e1c18f2')
