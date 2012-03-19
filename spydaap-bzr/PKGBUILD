# Maintainer: Ben Booth <benwbooth@gmail.com>
pkgname=spydaap-bzr
pkgver=153
pkgrel=1
pkgdesc="A Simple Python DAAP server"
arch=('any')
url="https://launchpad.net/spydaap"
license=('GPL')
depends=('python2' 'mutagen' 'pybonjour')
makedepends=('bzr')
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_bzrtrunk=lp:spydaap
_bzrmod=spydaap

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" "$_bzrmod"
  fi

  msg "Bazaar checkout done or server timeout"

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
}

package() {
  cd "$srcdir/$_bzrmod-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
