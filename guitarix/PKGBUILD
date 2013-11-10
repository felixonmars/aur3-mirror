# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=guitarix
pkgver=0.11.1
pkgrel=3
pkgdesc='Simple mono guitar amplifier for jack'
arch=('x86_64' 'i686')
url="http://guitarix.sourceforge.net/"
license=('GPL')
depends=('jack' 'gtkmm' 'fftw')
makedepends=('ladspa' 'python2' 'boost')
optdepends=('jack_capture' 'zita-convolver' 'zita-resampler' 'faust')
source=("http://downloads.sourceforge.net/sourceforge/guitarix/$pkgname-$pkgver.tar.bz2")
sha256sums=('6e1bbd7daf1a5872764c10f40c7c86d1c738a1cc5a4f924a9d41660b8b3ac127')

build() {
  cd "$pkgname-$pkgver"

  python2 ./waf configure --prefix="/usr"
  python2 ./waf build
}

package() {
  cd "$pkgname-$pkgver"

  python2 ./waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
