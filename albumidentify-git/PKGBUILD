# Maintainer: dryes <joswiseman@gmail>
pkgname=albumidentify-git
pkgver=20110613
pkgrel=1
pkgdesc="Tools to identify and manage music albums."
url="https://github.com/scottr/albumidentify"
arch=('any')
license=('Custom')
depends=('python2' 'python-musicbrainz2' 'libofa')
optdepends=('mpg123' 'mp3gain' 'flac' 'vorbis-tools' 'vorbisgain' 'cdrdao' 'cuetools' 'bchunk')
makedepends=('git')
install=('albumidentify.install')
provides=('albumidentify')

_gitroot="git://github.com/scottr/albumidentify.git"
_gitname="albumidentify"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cp -r "$srcdir/albumidentify" "$srcdir/albumidentify-build"
  cd "$srcdir/albumidentify-build"
  
  for _f in $(find -type f); do
    sed -i -r 's|^\#\!/usr/bin/(env )?python2?$|\#\!/usr/bin/python2|i' "$_f"
  done

  python2 setup.py install --root "$pkgdir"

  rm -rf "$srcdir/albumidentify-build"
}