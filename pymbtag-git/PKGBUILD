# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=pymbtag-git
pkgver=20110825
pkgrel=1
pkgdesc="Tag various music files with data from musicbrainz.org"
arch=('any')
url="http://github.com/mineo/pymbtag"
license=('MIT')
makedepends=('git')
depends=('python2' 'mutagen' 'python-musicbrainz2')
conflicts=('pymbtag')
provides=('pymbtag')

_gitroot="git://github.com/mineo/pymbtag.git"
_gitname="pymbtag"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
# vim:set ts=2 sw=2 et:
