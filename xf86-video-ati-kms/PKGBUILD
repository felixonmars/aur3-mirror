# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xf86-video-ati-kms
pkgver=20090410
pkgrel=2
pkgdesc="GEM aware radeon DDX"
arch=(i686 x86_64)
license=('MIT')
depends=('libdrm-kms' 'libpciaccess')
makedepends=('pkgconfig' 'xorg-server>=1.6.0' 'fontsproto' 'glproto>=1.4.9'
	     'git' 'xf86driproto' 'diffutils' 'xorg-util-macros')
provides=('xf86-video-ati')
replaces=('xf86-video-ati')
options=('!libtool')
url="http://tirdc.livejournal.com/"
_gitroot="git://anongit.freedesktop.org/~airlied/xf86-video-ati"
_gitname="xf86-video-ati"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    msg2 "Fetching sources..."
    cd $_gitname
    git checkout --track -b radeon-gem-cs2 origin/radeon-gem-cs2
  fi

  msg2 "Preparing..."
  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg2 "Starting make..."

  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
