# Contributor: Berkus <berkus@madfire.net>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=aldrin-hg
pkgver=724
pkgrel=1
pkgdesc="A Buzz-like tracker"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.aldrin.eu"
depends=('hicolor-icon-theme' 'pygtk' 'armstrong' 'python2-numpy')
makedepends=('scons' 'mercurial')
provides=('aldrin')
conflicts=('neil' 'libneil')
install="$pkgname.install"

_hgroot=http://bitbucket.org/paniq
_hgrepo=aldrin

build() {

  cd "$srcdir"
  msg "Connecting to Mercurial server...."
  if [ -d $_hgrepo ]; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo $_hgrepo
  fi

  msg "Mercurial clone done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  # Python2 fixes
  export PYTHON="python2"
  sed \
        -e "s_\(env python\).*_\12_" \
        -e "s_\(bin/python\).*_\12_" \
        -i `grep -rlE "(env python|bin/python)" .`
}

package() {

  cd "$srcdir/$_hgrepo-build"

  scons install PREFIX=/usr DESTDIR="$pkgdir/"
}

