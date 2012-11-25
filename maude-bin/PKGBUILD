# Contributor: Peter Simons <simons@cryp.to>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=maude-bin
pkgver=2.6
pkgrel=1
pkgdesc="High-level Specification Language, binary (pre-compiled) version."
arch=('i686' 'x86_64')
url='http://maude.cs.uiuc.edu/'
license=('GPL')
# it seems that the following deps are not needed for th pre-compiled version
# but they come from the "maude" pkg.
#depends=('buddy' 'libtecla' 'gmp' 'libsigsegv')
# ldd maude.linux (32-bit) requires ncurses
depends=('ncurses')
conflicts=('maude')
source=( "http://maude.cs.uiuc.edu/download/current/maude.tar.gz"
         "http://maude.cs.uiuc.edu/download/current/FM2.6/full-maude26.maude"
	     "profile.sh" )
md5sums=('36e0f7339fc860fd26089506cc1f44e1'
         '7bab068a28777b1281455247f97af751'
         '0a51738365579574b40a3d32da6f3291')

ext=""
case "$CARCH" in
    x86_64) ext="64" ;; 
    i686) ;;
    *)  
        msg "Unrecognised arch, assuming 32 bit"
        ;;
esac
package() {
  install -d "$pkgdir/usr/share/maude/"
  install -m 444 -t "$pkgdir/usr/share/maude/" "$srcdir"/maude/*.maude

  install -D -m 555 "$srcdir/maude/maude.linux$ext" \
      "$pkgdir/usr/bin/maude"
  install -D -m 444 "$srcdir/full-maude26.maude" \
    "$pkgdir/usr/share/maude/full-maude.maude"
  install -D -m 555 "$srcdir/profile.sh" \
    "$pkgdir/etc/profile.d/maude.sh"
}
