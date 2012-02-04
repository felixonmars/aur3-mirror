# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=omvviewer-git
pkgver=20100303
pkgrel=1
pkgdesc="Open metaverse viewer is a project aimed to package the Second Life(tm) viewer for Linux distributions."
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/index.shtml"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gtk2' 'libgl' 'libidn' 'mesa' 'nss' 'sdl' 'openjpeg' 'xmlrpc-epi' 'c-ares' 'ttf-dejavu' 'omvviewer-artwork-git' 'ndofdev' 'libpng')
makedepends=('git' 'gcc' 'make' 'patch' 'quilt' 'python' 'bison' 'flex' 'cmake' 'boost')
provides=('secondlife')
conflicts=('omvviewer')
source=('omvviewer.desktop' 'viewericon.xpm' 'use_archlinux-included_fonts.diff' 'libpng14-patch.diff' 'gstreamer-0.10.26-patch.diff' 'boost-1.42.0-1-patch.diff')
md5sums=('a80b577f1aa8c01ea0e62476626ab4c1'
         'd1a48ab3659a3775704cd86ccf804942'
         'de2d6f866e4b29f67b8cb1deb28f5210'
         '4943e5576b659bf81a33dfa9119b057f'
         'e95a0d33a2b91f93d8ab44f43997137d'
         '79be764dc4931940dee83e1022c3d0ba')
optdepends=('gstreamer0.10: in-world movie playback')

_gitroot="git://git.byteme.org.uk/home/git/slviewer.git"
_gitname="slviewer"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
    (cd $_gitname && git checkout -b linux origin/linux)
  fi
  msg "GIT checkout done or server timeout"

  msg "Cloning source code"
  rm -rf $_gitname-build
  cp -R $_gitname $_gitname-build
  cd $_gitname-build

  msg "Applying patches for ArchLinux"
  patch -p1 < $srcdir/gstreamer-0.10.26-patch.diff
  patch -p1 < $srcdir/use_archlinux-included_fonts.diff
  patch -p1 < $srcdir/libpng14-patch.diff
  patch -p1 < $srcdir/boost-1.42.0-1-patch.diff

  msg "Starting make..."
  make patch || return 1
  # In order to make it build, I used a dirty work which disables -Werror
  make configure DATA_LOCATION=/usr/share/omvviewer BINARY_LOCATION=/usr/bin BINARY_NAME="omvviewer -DGCC_DISABLE_FATAL_WARNINGS:BOOL=TRUE" MOZLIB=FALSE || return 1
  make build || return 1
  make DESTDIR=$pkgdir install || return 1

  # Install Desktop File
  install -D -m644 $srcdir/omvviewer.desktop \
      $pkgdir/usr/share/applications/omvviewer.desktop

  # Install Icon File
  install -D -m644 $srcdir/viewericon.xpm \
      $pkgdir/usr/share/pixmaps/viewericon.xpm
}
