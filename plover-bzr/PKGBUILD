# Maintainer: craven@gmx.net
pkgname=plover-bzr
pkgver=63
pkgrel=1
pkgdesc="Plover is a free open source program intended to bring realtime stenographic technology not just to stenographers, but also to hackers, hobbyists, accessibility mavens, and all-around speed demons."
arch=(any)
url="https://launchpad.net/plover"
license=('GPLv2')
groups=()
depends=('python2' 'wxpython' 'python-xlib' 'python2-pyserial' 'python2-lockfile')
makedepends=('bzr' 'python2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_bzrtrunk=http://bazaar.launchpad.net/~joshua-harlan-lifton/plover/trunk/
_bzrmod=plover

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"
}

package() {
  cd "$srcdir/$_bzrmod-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
