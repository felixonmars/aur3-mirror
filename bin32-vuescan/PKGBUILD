# Contributor: David Spicer <azleifel at gmail dot com>

_pkgsourcename=VueScan
_pkgbasename=vuescan
pkgname=bin32-$_pkgbasename
pkgver=9.5
pkgrel=1
pkgdesc="A powerful but easy to use OSI scanning tool (9.5 series, 32-bit)."
arch=('x86_64')
url="http://www.hamrick.com/"
license=('custom')
depends=('lib32-gtk2' 'lib32-libsm' 'lib32-libusb-compat')
optdepends=('lib32-gtk-engines: Or other lib32 gtk engine for current theme'
            'lib32-libcanberra: For desktop event sounds'
            'lib32-libcanberra-pulse: For desktop event sounds with pulseaudio')
conflicts=('vuescan')
options=(!strip)
source=(http://www.hamrick.com/files/vuex3295.tgz
        license.txt
        vuescan-32.sh
        vuescan.desktop)
md5sums=('SKIP'
         'c5b9a854dfae7370cf0bead9840e5932'
         '1d7b3df74013f6b7294d569389b2989e'
         '00b343c1d76e394347a75ebfe669b66c')

package() {
  cd "$srcdir"

  # Application
  install -d -m755 "$pkgdir/opt/$_pkgbasename"
  cp -rp "$_pkgsourcename"/* "$pkgdir/opt/$_pkgbasename/"

  # Extras
  install -D -m755 "$srcdir/$_pkgbasename-32.sh" "$pkgdir/usr/bin/$_pkgbasename"
  install -D -m644 "$srcdir/$_pkgbasename.desktop" "$pkgdir/usr/share/applications/$_pkgbasename.desktop"

  # License
  install -D -m644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

