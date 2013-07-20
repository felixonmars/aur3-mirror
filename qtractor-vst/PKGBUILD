# Maintainer : prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>
# Contributor: carrouf <pizza.tony@free.fr>

_pkgname=qtractor
pkgname=qtractor-vst
pkgver=0.5.10
pkgrel=1
pkgdesc="Audio/MIDI multitrack sequencer (with Linux-native VST support)"
arch=('i686' 'x86_64')
url="http://qtractor.sourceforge.net/"
license=('GPL')
depends=('jack' 'qt4' 'suil' 'lilv' 'libmad' 'rubberband' 'liblo' 'shared-mime-info')
makedepends=('ladspa' 'dssi' 'steinberg-vst')
[ "$CARCH" = "i686" ] && optdepends=('dssi-vst: win32 VST support')
install=$_pkgname.install
source=("http://downloads.sourceforge.net/project/$_pkgname/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('54a9c2b4eb0f65e44bdc27c91849a341')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr \
              --with-vst=/usr/include/vst

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
