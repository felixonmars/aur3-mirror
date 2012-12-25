# Contributor: twa022 <twa022 at gmail dot com>
# Maintainer: David Spicer <azleifel at gmail.com>

pkgname=xine-lib-1.2-hg
pkgver=12273
pkgrel=1
pkgdesc="The xine engine (1.2 development branch)"
arch=('i686' 'x86_64')
url="http://www.xine-project.org"
license=('LGPL' 'GPL')
depends=('libxvmc' 'ffmpeg' 'libxinerama')
makedepends=('a52dec'  'aalib' 'faad2' 'glu' 'gnome-vfs' 'imagemagick'
             'jack' 'libbluray' 'libcaca' 'libdca' 'libmad' 'libmng'
             'libmodplug' 'libmpcdec' 'libvdpau' 'mesa' 'vcdimager'
             'wavpack')
optdepends=('a52dec: for using the a52 plugin' \
            'aalib: for using the aalib plugin' \
            'faad2: for using the faad plugin' \
            'glu: for using the opengl plugin' \
            'gnome-vfs: for using the gnome-vfs plugin' \
            'imagemagick: for using the imagemagick plugin' \
            'jack: for using the jack plugin' \
            'libbluray: for using the bluray plugin' \
            'libcaca: for using the caca plugin' \
            'libdca: for using the dca plugin' \
            'libmad: for using the mp3 plugin' \
            'libmng: for using the mng plugin' \
            'libmodplug: for using the modplug plugin' \
            'libmpcdec: for using the musepack plugin' \
            'libvdpau: for using the VDPAU plugin' \
            'vcdimager: for using the vcd plugin' \
            'wavpack: for using the wavpack plugin')
provides=('xine-lib')
conflicts=('xine-lib')
options=('!libtool')

_hgroot="http://hg.debian.org/hg/xine-lib/"
_hgrepo="xine-lib-1.2"

build() {
  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [ -d ${_hgrepo} ] ; then
    cd ${_hgrepo}
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone ${_hgroot}${_hgrepo} || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_hgrepo}-build"
  cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}-build"

  ./autogen.sh --prefix=/usr --with-wavpack \
               --enable-vdpau --disable-optimizations
  make
}

package() {
  cd "${srcdir}/${_hgrepo}-build"
  make DESTDIR="${pkgdir}" install

  rm -rf "${srcdir}/${_hgrepo}-build"
}
