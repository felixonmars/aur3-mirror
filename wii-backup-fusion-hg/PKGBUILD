# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=wii-backup-fusion-hg
pkgver=289
pkgrel=1
pkgdesc="graphical frontend to wimm's iso tools"
arch=(i686 x86_64)
url="http://wiibafu.codeplex.com/"
license=('GPL')
depends=("qt" "wiimms-iso-tools")
makedepends=('mercurial')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="https://hg01.codeplex.com/wiibafu"
_hgrepo="$pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  qmake 
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  mkdir -p $pkgdir/usr/bin
  install -m 755 bin/WiiBaFu $pkgdir/usr/bin
} 
