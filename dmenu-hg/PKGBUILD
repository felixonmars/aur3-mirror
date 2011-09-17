# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: v2punkt0 <v2punkt0@gmail.com>

pkgname='dmenu-hg'
pkgver=433
pkgrel=2
pkgdesc="The latest hg pull of dmenu"
url="http://tools.suckless.org/dmenu/"
license='MIT'
arch=('i686' 'x86_64')
depends=('libx11')
makedepends=('mercurial')
conflicts=('dmenu')
provides=('dmenu')

_hgroot='http://hg.suckless.org'
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
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  make || return 1
}

package(){
  cd "$srcdir/$_hgrepo-build"
  install -Dm644 ${srcdir}/${_hgrepo-build}/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  make MANPREFIX="$pkgdir/usr/share/man" PREFIX="$pkgdir" clean install || return 1
}

# vim:set ts=2 sw=2 et:
