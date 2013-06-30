# Maintainer: Gu1 <gu1@aeroxteam.fr>
pkgname=python2-hubicclient-git
pkgver=20130319
pkgrel=1
pkgdesc="A Client for the HubiC cloud storage service"
arch=('any')
url="https://github.com/Gu1/python-hubicclient"
license=('Apache 2.0')
depends=('python2' 'python2-swiftclient')
makedepends=('git')
options=(!emptydirs)
_gitroot="git://github.com/Gu1/python-hubicclient.git"
_gitname="python-hubicclient"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  msg2 'Replacing python shebang by python2 shebang...'
  find . -type f -exec sed -i \
    -e'1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
