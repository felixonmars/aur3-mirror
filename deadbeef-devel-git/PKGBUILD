# Maintainer: Shtsh <liparinai@gmail.com>

pkgname=deadbeef-devel-git
pkgver=20100601
pkgrel=1
pkgdesc="mp3/ogg/flac/sid/mod/nsf music player based on GTK2. Developer version"
url="http://deadbeef.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('alsa-lib' 'gtk2' 'libsamplerate')
makedepends=('autoconf' 'automake' 'git')
optdepends=('libvorbis: ogg vorbis playback' 'libmad: mp1/2/3 playback' 'flac: flac playback' 'curl: lastfm scrobbler, shoutcast, icecast, podcast support' 'wavpack: wv playback' 'libsndfile: wav playback' 'libcdio: audio cd playback')
_gitroot="git://deadbeef.git.sourceforge.net/gitroot/deadbeef/deadbeef/"
_gitname="deadbeef"

conflicts=('deadbeef' 'deadbeef-git')



build() {
  cd $startdir

  msg "Connecting to github.com GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
	git checkout devel
    msg "The local files are updated."
  else
    git clone -b devel $_gitroot
  	cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"


  msg "Building..."

  ./autogen.sh
  ./configure --prefix=/usr
  make
  make prefix=$pkgdir/usr install
}
