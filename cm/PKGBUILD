# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=cm
pkgver=3.7.2
pkgrel=2
pkgdesc="Common Music is a real-time music composition system implemented in C++ and Scheme"
arch=(i686 x86_64)
url="http://commonmusic.sourceforge.net/"
license=('GPL')
depends=('sndlib' 'mesa' 'freetype2' 'liblo' 'libxinerama')
makedepends=('premake')
provides=('cm-grace')
conflicts=('cm-grace-bin')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/commonmusic/$pkgname/$pkgver/$pkgname-$pkgver.zip"
        "http://commonmusic.sourceforge.net/index_files/cmlogobb.png"
        "cm-grace.desktop")
md5sums=('71d8af0dd3f4a62144692252403f79b4'
         '94071a8ecb77bc895cd0abe642d1bed7'
         '98b16cd7c87fb524e882fa1679b7dfb5')

build() {
  cd "$srcdir/$pkgname"

  # prevent segfaults
  unset CFLAGS CXXFLAGS

  # linking errors with -Wl,--as-needed
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  # fix native jack callback
  sed "s|t\* status|&, ...|" -i src/juce_amalgamated.cpp

  # configure
  premake --verbose \
          --os linux \
          --target gnu \
          --sndlib /usr \
          --liblo /usr

  # build
  make CONFIG=Debug
}

package() {
  cd "$srcdir/$pkgname"

  # cm bin
  install -Dm755 bin/cm "$pkgdir/usr/bin/cm"

  # grace bin
  install -Dm755 bin/Grace "$pkgdir/usr/bin/cm-grace"

  # pixmaps and desktop file
  install -Dm644 ../cmlogobb.png "$pkgdir/usr/share/pixmaps/cm-grace.png"
  install -Dm644 ../cm-grace.desktop "$pkgdir/usr/share/applications/cm-grace.desktop"
}

# vim:set ts=2 sw=2 et:
