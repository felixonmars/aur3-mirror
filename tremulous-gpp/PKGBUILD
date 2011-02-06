# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=tremulous-gpp
pkgver=1
pkgrel=4
pkgdesc="The Gameplay Preview (beta) for Tremulous 1.2"
arch=(i686 x86_64)
url="http://tremulous.net"
license=('GPL')
depends=('tremulous-data=1.1.0' 'sdl' 'openal>=1.7.411')
makedepends=(mesa)
source=(http://downloads.sourceforge.net/tremulous/$pkgname$pkgver.zip
        tremulous.launcher tremded.launcher tremulous.desktop)
md5sums=('70a32d6e587e4ac67bdfd0be7d6edc2f'
         '5956668857a27d7a4c45686a4a697034'
         '37f98a905e63759526a62b07b613786b'
         '7023a343ca51d438b710d4e8e804a368')
options=('!strip')

# Change this to 'debug' if you want debugging symbols enabled
_maketarget='release'

build() {
  cd "$srcdir/tremulous"

  # Unpack the sources and build
  bsdtar -xf $pkgname$pkgver-src.tar.gz || return 1
  cd "tremulous-ggp$pkgver-src/"
  sed -i 's/openal-config/pkg-config/g' Makefile
  make $_maketarget || return 1

}

package() {
  cd $srcdir/tremulous/tremulous-ggp1-src

  install -dm755 $pkgdir/opt/tremulous

  # Install Binaries
  local _arch=${CARCH/i686/x86}
  install -m755 build/$_maketarget-linux-$_arch/*.$_arch $pkgdir/opt/tremulous
  for bin in $pkgdir/opt/tremulous/*.$_arch; do mv $bin ${bin/./-gpp.}; done

  # Install data files
  install -d -m755 $pkgdir/opt/tremulous/gpp
  install -m644 $srcdir/tremulous/gpp/*.{pk3,cfg} $pkgdir/opt/tremulous/gpp/

  # Install Client Launcher
  install -D -m755 $srcdir/tremulous.launcher $pkgdir/usr/bin/tremulous-gpp

  # Install Server Launcher
  install -D -m755 $srcdir/tremded.launcher   $pkgdir/usr/bin/tremded-gpp

  # Install Desktop Icons
  install -D -m644 $srcdir/tremulous.desktop  $pkgdir/usr/share/applications/tremulous-gpp.desktop
  install -D -m644 misc/tremulous.xpm         $pkgdir/usr/share/pixmaps/tremulous-gpp.xpm
}

# vim:set ts=2 sw=2 et:
