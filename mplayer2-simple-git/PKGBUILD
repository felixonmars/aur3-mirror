# Maintainer: loonyphoenix < loonyphoenix at gmail >
# Contributor: misc
# This package is similar to mplayer2-git, but it simplifies the build process by
# linking to the system ffmpeg/libav libraries instead of building a dedicated copy

pkgname=mplayer2-simple-git
pkgver=20121122
pkgrel=1
pkgdesc="An advanced general-purpose media player"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mplayer2.org/"
install=$pkgname.install
depends=('ffmpeg' 'fontconfig' 'libass' 'libdvdread' 'libdvdnav' 'libgl'
         'libxss' 'libxxf86dga' 'ttf-dejavu')
# Uncomment lines below to add dependencies 
#depends+=('a52dec' 'aalib' 'cdparanoia' 'desktop-file-utils' 'enca' 'faad2'
#         'freetype2' 'jack' 'ladspa' 'lame' 'libbluray' 'libcaca' 'libcdio'
#         'libdca' 'libdvdnav' 'libjpeg' 'libmad' 'libpulse' 'libtheora' 'libvdpau'
#         'libxinerama' 'libxv' 'libxxf86vm' 'lirc-utils' 'mpg123' 'ncurses' 'sdl')
makedepends=('git' 'python' 'python-docutils' 'mesa' 'yasm' 'unzip')
optdepends=('libdvdcss: for playback of encrypted dvds'
            'unrar: for playback of media files inside rar archives')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=('mplayer' 'mplayer2' 'mplayer2-git')
conflicts=('mplayer' 'mplayer2' 'mplayer2-git')
options=(!emptydirs)
source=('mplayer.desktop')
md5sums=('af6ba58cc34322bf12e46e8d1d42d75f')

_gitroot="git://git.mplayer2.org/mplayer2.git"
_gitname="mplayer2"
_gitbranch="master"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" -b $_gitbranch --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix=/usr --confdir=/etc/mplayer\
              --enable-translation --language=all \
              --disable-xvid \
              --disable-speex \
              --disable-openal \
              --disable-libdv \
              --disable-musepack

  make

}

package() {

  cd "${srcdir}/${_gitname}-build"

  make DESTDIR="${pkgdir}" install

  install -m644 etc/{codecs,input,example}.conf "${pkgdir}/etc/mplayer/"
  install -d -m755 "${pkgdir}/usr/share/mplayer"
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "${pkgdir}/usr/share/mplayer/subfont.ttf"

  install -dm755 "${pkgdir}"/usr/share/applications/
  install -m 644 etc/mplayer.desktop "${pkgdir}"/usr/share/applications/

}
