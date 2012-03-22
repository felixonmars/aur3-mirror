# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Matej Lach <matej.lach@gmail.com>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# Contributor: extcake < extcake@gmail.com >
# Based on the mplayer2-git and mplayer-mt-lite package

pkgname=mplayer2-lite-git
pkgver=20120322
pkgrel=1
pkgdesc="A movie player for linux (uses dynamically linked libav; git version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mplayer2.org/"

# set 1 to force mplayer not to use alsa-lib.
_noalsa=0

# depnds only you already have, others should contained in ffmpeg's depends.
[ "x$_noalsa" == "x0" ] && _alsa=$(pacman -Q alsa-lib 2>/dev/null | awk '{print $1}')
_smbclient=$(pacman -Q smbclient 2>/dev/null | awk '{print $1}')
_libxvmc=$(pacman -Q libxvmc 2>/dev/null | awk '{print $1}')
_faad2=$(pacman -Q faad2 2>/dev/null | awk '{print $1}')
_libpulse=$(pacman -Q libpulse 2>/dev/null | awk '{print $1}')

depends=('libgl' 'libxv' 'libxss' 'fribidi' 'libbluray' 'libxxf86dga' 'sdl' 'desktop-file-utils' 'ffmpeg' 'libass')
makedepends=('git' 'live-media' 'mesa' 'python2' 'unzip' 'videoproto' 'yasm')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=('mplayer' 'mplayer2' 'mplayer2-git')
conflicts=('mplayer' 'mplayer2' 'mplayer2-git')
options=(!emptydirs)
install=mplayer2.install
source=('mplayer2.install' 'mplayer.desktop')
md5sums=('cbc234e5e789e30c624741173992a225'
        'af6ba58cc34322bf12e46e8d1d42d75f')

_gitroot="git://git.mplayer2.org/mplayer2.git"
_gitname="mplayer2"

build() {
  # Custom CFLAGS break the mplayer build
  unset CFLAGS
  unset LDFLAGS

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  _options=""
  [ ! -z $_xvmc ] && _options="$_options --enable-xvmc"
  [ ! -z $_faad2 ] && _options="$_options --enable-faad"
  [ "x$_noalsa" == "x1" ] && _options="$_options --disable-alsa"

  ./configure --prefix=/usr --confdir=/etc/mplayer \
      --yasm=yasm --language=all

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make
}

package() {
  cd "${srcdir}/${_gitname}-build"

  make -j1 DESTDIR="${pkgdir}" install

  install -d ${pkgdir}/etc/mplayer/
  install -m644 ${srcdir}/${_gitname}-build/etc/{codecs,input,example}.conf "${pkgdir}/etc/mplayer/"
  install -d -m755 "${pkgdir}/usr/share/mplayer"
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "${pkgdir}/usr/share/mplayer/subfont.ttf"

  # there is a desktop file where the xpm is, but we don't want that
  install -Dm644 "${srcdir}/mplayer.desktop" "${pkgdir}/usr/share/applications/mplayer.desktop"
  install -Dm644 "${srcdir}/${_gitname}-build/etc/mplayer.xpm" "${pkgdir}/usr/share/pixmaps/mplayer.xpm"
}
