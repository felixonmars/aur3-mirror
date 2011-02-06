# Contributor: Jon Raphaelson <jonraphaelson@gmail.com>

pkgname='dmenu-hg-xdg'
pkgver=384
pkgrel=1
pkgdesc="The latest hg pull of dmenu, with a patch to put cache files in XDG cache directories."
url="http://tools.suckless.org/dmenu/"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11' 'libxdg-basedir')
makedepends=('mercurial')
conflicts=('dmenu')
provides=('dmenu')
source=('xdgbasedir.patch')
md5sums=('627bf53074ece557ab074b8781031b6a')

_hgroot='http://hg.suckless.org/'
_hgrepo='dmenu'

build() {
  cd $srcdir
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  msg "Patching for XDG Base Directories"
  patch -p1 < ../../xdgbasedir.patch

  #
  # BUILD HERE
  #

  msg "Starting make..."
  make || return 1
}

package(){
  cd "$srcdir/$_hgrepo-build"
  install -Dm644 ${srcdir}/${_hgrepo-build}/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  make MANPREFIX="$pkgdir/usr/share/man" PREFIX="$pkgdir" clean install || return 1
}

# vim:set ts=2 sw=2 et:
