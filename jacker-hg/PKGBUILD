# Maintainer: Philipp Überbacher <murks@lavabit.com>
pkgname=jacker-hg
pkgver=199
pkgrel=1
pkgdesc="A pattern based, tracker-like jack midi sequencer."
arch=('i686' 'x86_64')
url="http://bitbucket.org/paniq/jacker/"
license=('GPL')
depends=('gtkmm' 'jack' 'libsigc++')
makedepends=('mercurial' 'scons')
provides=('jacker')

_hgroot="http://bitbucket.org/paniq"
_hgrepo="jacker"

build() {
  cd "${srcdir}"
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

  scons PREFIX=/usr
}

package() {
  cd "${srcdir}/$_hgrepo-build"
  scons DESTDIR="${pkgdir}" install
}
