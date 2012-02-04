# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=qtspim
pkgver=9.1.4
pkgrel=1
pkgdesc="New user interface for spim, a MIPS simulator"
arch=('i686' 'x86_64')
url="http://spimsimulator.sourceforge.net/"
license=('BSD')
depends=('qt')
makedepends=('subversion')
source=()
md5sums=()

__svntrunk="https://spimsimulator.svn.sourceforge.net/svnroot/spimsimulator"
__modules=('QtSpim' 'CPU' 'Documentation' 'Setup')
__svnrev=588

build() {
  if [ ! -d "$srcdir/src" ]; then
    mkdir "$srcdir/src"
  fi
  cd "$srcdir/src"

  msg "Connecting to SVN server......."
  for i in "${__modules[@]}"; do
    if [ -d "$i/.svn" ]; then
      cd "$i" && svn up -r $__svnrev
    else
      svn co "$__svntrunk/$i" --config-dir ./ -r $__svnrev "$i"
    fi
  done
  msg "SVN checkout done or server timeout"

  if [ -e "$srcdir/build" ]; then
    rm -rf "$srcdir/build"
  fi
  cp -a "$srcdir/src" "$srcdir/build"

  msg "Starting make..."
  cd "$srcdir/build/QtSpim"

  unset MAKEFLAGS
  qmake
  make
}

package() {
  cd "$srcdir/build/QtSpim"
  install -d -m755 "$pkgdir"/usr/share/qtspim
  cp -r help "$pkgdir"/usr/share/qtspim/
  rm -rf "$pkgdir"/usr/share/qtspim/help/.svn
  install -D -m755 QtSpim "$pkgdir"/usr/bin/qtspim

  cd "$srcdir/build"
  install -D -m644 Documentation/spim.man "$pkgdir"/usr/share/man/man1/qtspim.1
  install -D -m644 Setup/qtspim_debian_deployment/qtspim.desktop "$pkgdir"/usr/share/applications/qtspim.desktop
  install -D -m644 Setup/qtspim_debian_deployment/copyright "$pkgdir"/usr/share/licenses/$pkgname/copyright
  install -D -m644 Setup/NewIcon48x48.png "$pkgdir"/usr/share/qtspim/qtspim.png
}

# vim:set ts=2 sw=2 et:
