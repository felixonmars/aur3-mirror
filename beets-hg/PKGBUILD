# Maintainer: Adrian Sampson <adrian@radbox.org>

python=python2

pkgname=beets-hg
pkgver=1506
pkgrel=2
pkgdesc="flexible music library manager and tagger - dev version"
arch=('any')
url="http://beets.radbox.org/"
license=('MIT')
depends=('python2-munkres' 'mutagen'
         'python2-distribute' 'python2-unidecode'
         'python2-musicbrainzngs' 'python2-yaml')
makedepends=('mercurial')
provides=('beets')
conflicts=('beets')
optdepends=('python2-pyacoustid: acoustic fingerprinting'
            'python2-flask: web interface'
            'gstreamer0.10-python: BPD audio player plugin'
            'python2-pylast: lastgenre plugin')

_hgroot="https://bitbucket.org/adrian"
_hgrepo="beets"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot/$_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting setup.py build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  $python setup.py build || return 1
}

package() {
  cd "$srcdir/$_hgrepo-build"
  $python setup.py install --root=$pkgdir
} 

pkgver() {
  cd "$srcdir/$_hgrepo"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}
