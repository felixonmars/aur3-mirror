# Contributor: Cyker Way <cykerway at gmail dot com>

pkgname=(bjap-git)
pkgver=20130911
pkgrel=1
pkgdesc="BeijingAir Plotter"
arch=(any)
url="https://github.com/cykerway/bjap"
license=(MIT)
depends=('python2>=2.7' 'python2-tweepy')
makedepends=('git')
provides=('bjap')
conflicts=('bjap')
source=()
noextract=()

_gitroot="git://github.com/cykerway/bjap.git"
_gitname="master"

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

  #
  # BUILD HERE
  #
  # Nothing to be done.
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
