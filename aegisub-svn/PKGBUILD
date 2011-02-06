# Maintainer Kevin <arc.mission at gmail>

pkgname=aegisub-svn
pkgver=4749
pkgrel=1
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (SVN version)"
arch=('i686' 'x86_64')
url="http://www.aegisub.org"
license=('GPL' 'BSD')
depends=('ffmpeg' 'wxgtk-2.9' 'hunspell' 'lua')
makedepends=('subversion') 
optdepends=('pulseaudio: PulseAudio support'
	    'alsa-lib: ALSA support'
	    'openal: OpenAL support'
	    'portaudio: Portaudio support')
provides=("aegisub")
conflicts=("aegisub")

_svntrunk=http://svn.aegisub.org/trunk/aegisub
_svnmod=aegisub

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
  ./autogen.sh --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.9
  make || return 1
  make DESTDIR="$pkgdir/" install
}
