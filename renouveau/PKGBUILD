# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=renouveau
pkgver=20110108
pkgrel=1
pkgdesc="A tool for clean room reverse engineering of nVidia drivers"
arch=('i686' 'x86_64')
url="http://nouveau.freedesktop.org"
license=('MIT')
depends=('sdl' 'nvidia-utils' 'libxvmc')
makedepends=('cvs')
options=('!strip' 'docs')
install=renouveau.install
source=()
md5sums=()

_cvsroot=":pserver:anonymous@nouveau.cvs.sourceforge.net:/cvsroot/nouveau"
_cvsmod="renouveau"

build() {
  cd "$srcdir"
  msg "Connecting to nouveau.cvs.sourceforge.net CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r $_cvsmod $_cvsmod-build
  cd $_cvsmod-build

  make

  install -Dm755 renouveau "$pkgdir/usr/bin/renouveau"
  install -Dm755 disasm_shader "$pkgdir/usr/bin/disasm_shader"
  install -Dm644 README "$pkgdir/usr/share/doc/README"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/renouveau/license.txt"

  rm -rf "$srcdir/$_cvsmod-build"
}
