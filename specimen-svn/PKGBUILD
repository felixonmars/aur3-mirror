# Contributor: Robert Schwarz <mail@rschwarz.net>
pkgname=specimen-svn
pkgver=88
pkgrel=2
pkgdesc="an open source, MIDI controllable audio sampler"
arch=('i686' 'x86_64')
url="http://zhevny.com/specimen/"
license=('GPL')
depends=('gtk2' 'libxml2' 'libsndfile' 'libsamplerate' 'alsa-lib>=0.9.0' 'jack-audio-connection-kit' 'phat')
conflicts=(specimen)
provides=(specimen)
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://zhevny.com/svn/specimen/branches/devel
_svnmod=specimen

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
