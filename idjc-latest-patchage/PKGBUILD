# Contributor: Tobias Luther <tobias [at] tonstrom [dot] de>
#              Silvio Knizek <killermoehre [at] gmx [dot] de>

pkgname=idjc-latest-patchage
pkgver=20110107
pkgrel=1
pkgdesc="A graphical shoutcast and icecast client that runs under GTK+ and the JACK audio connection kit. In short, it's an Internet radio app for making a live radio show. Without qjackctl-dep -> without qt"
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('python' 'jack' 'pygtk' 'lame' 'mutagen' 'flac' 'faad2' 'libsamplerate' 'libshout' 'vorbis-tools' 'libsndfile' 'ffmpeg' 'libmad' 'patchage' 'speex')
makedepends=('pkgconfig' 'git')
conflicts=('idjc')
source=(patch)
_gitroot="git://idjc.git.sourceforge.net/gitroot/idjc/idjc"
_gitname="idjc"

md5sums=('eeb2c55443f753f9244eaac006cce132')
license=('GPLv3')

build()
{
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
	
        
        ./env-up  &&  patch -Np1 -i ../patch
        ./configure --prefix=/usr CFLAGS="-O2" PYTHON="/usr/bin/python2"
              make || return 1
                make DESTDIR=$pkgdir install
}


