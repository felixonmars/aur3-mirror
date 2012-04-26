# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ctrlr-bin
pkgver=5.0.3
pkgrel=1
pkgdesc="A MIDI hardware controller editor"
arch=(i686 x86_64)
url="http://ctrlr.org/"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'freetype2')
provides=('ctrlr')
conflicts=('ctrlr')
source=("http://downloads.sourceforge.net/project/ctrlrv4/Stable/Ctrlr.bin")
md5sums=('ce718cd0c3326c662c285de27f9baa26')

build() {
  cd "$srcdir"

  # extract archive
  tail -n +403 Ctrlr.bin | bsdtar jxvf - --exclude=.svn
}

package() {
  cd "$srcdir"

  # bin
  install -Dm755 Standalone/Ctrlr-$CARCH \
    "$pkgdir/usr/bin/ctrlr"

  # vst plugin
  install -Dm644 VST/Ctrlr-VST-$CARCH.so \
    "$pkgdir/usr/lib/vst/ctrlr.so"

  # panels
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a Panels/* "$pkgdir/usr/share/$pkgname"

  # doc
  install -Dm644 Doc/html/Ctrlr.chm \
    "$pkgdir/usr/share/doc/ctrlr.chm"
}

# vim:set ts=2 sw=2 et:
