# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Diego Cano <elkano@blep.org>
pkgname=d2_config-hg
pkgver=2
pkgrel=1
pkgdesc="A script to manage different D2 compilers"
arch=('i686' 'x86_64')
url="http://blep.org/"
license=('GPL')
groups=()
depends=()
# Comment/Uncomment depending on your available D2 compiler
makedepends=('mercurial' 'dmd2-complete')
#makedepends=('mercurial' 'gdc2-hg')
#makedepends=('mercurial') # I am not sure of the ldc package to use for ldc 2. Sorry
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="d2-config.install"
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="https://bitbucket.org/elkano"
_hgrepo="d2-config"

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

  # Once again, comment or uncomment depending of your needs
  dmd d2-config.d
  #gdc -o d2-config{,.d}
  #ldc d2-config.d
}

package() {
  cd "$srcdir/$_hgrepo-build"
  mkdir "$pkgdir/bin/"
  cp d2-config "$pkgdir/bin/"
} 
