# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=omvviewer
pkgver=1.22.11
pkgrel=3
origpkgrel=1
pkgdesc="Open metaverse viewer is a project aimed to package the Second Life(tm) viewer for Linux distributions."
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/index.shtml"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gtk2' 'libgl' 'libidn' 'mesa' 'nss' 'sdl' 'openjpeg' 'xmlrpc-epi' 'c-ares' 'ttf-dejavu' 'omvviewer-artwork=1.22.11' 'libogg' 'libvorbis')
makedepends=('gcc' 'make' 'patch' 'python' 'bison' 'flex' 'cmake' 'boost')
provides=('secondlife')
conflicts=('secondlife' 'secondlife-svn' 'secondlife-bin' 'omvviewer-git')
source=("http://apt.byteme.org.uk/pool/main/o/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "http://apt.byteme.org.uk/pool/main/o/${pkgname}/${pkgname}_${pkgver}-${origpkgrel}.diff.gz")

optdepends=('gstreamer0.10: in-world movie playback'
            'omvviewer-mozlib-qt: in-world web browsing (install it before compiling)')

build() {
  cd $srcdir/linden

  # Applying the debian package patch
  patch -p1 < ../${pkgname}_${pkgver}-${origpkgrel}.diff || return 1

  # Applying patches in the debian/patches directory
  ln -s debian/patches/topic .
  xargs -l -a debian/patches/series patch -i

  # Fix the web browser window that omvviewer-mozlib-qt seems weird colored
  sed -i 's/primary_format = GL_BGRA_EXT;/primary_format = GL_RGBA;/' $srcdir/linden/indra/newview/llwebbrowserctrl.cpp

  # Configure
  mkdir -p indra/build
  cd indra/build
  cmake -DUNATTENDED:BOOl=FALSE \
  -DSTANDALONE:BOOL=TRUE \
  -DCMAKE_BUILD_TYPE:STRING=RELEASE \
  -DSERVER:BOOL=FALSE \
  -DCMAKE_CURRENT_BINARY_DIR:STRING= \
  -DVIEWER:BOOL=TRUE \
  -DINSTALL:BOOL=TRUE \
  -DAPP_SHARE_DIR:STRING=/usr/share/omvviewer \
  -DAPP_BINARY_DIR:STRING=/usr/bin \
  -DVIEWER_BINARY_NAME:STRING=omvviewer \
  -DOPENAL:BOOL=TRUE \
  -DGCC_DISABLE_FATAL_WARNINGS:BOOL=TRUE \
  .. || return 1

  # Make and Install
  make || return 1
  make DESTDIR=$pkgdir install || return 1


  # Install Desktop File
  install -D -m644 $srcdir/linden/debian/omvviewer.desktop \
      $pkgdir/usr/share/applications/omvviewer.desktop

  # Install Icon File
  install -D -m644 $srcdir/linden/indra/newview/res/viewericon.xpm \
      $pkgdir/usr/share/pixmaps/viewericon.xpm

  # Fix the font config which points to the font file which is not exist in arch system.
  sed -i 's/\/usr\/share\/fonts\/truetype\/ttf-dejavu/\/usr\/share\/fonts\/TTF/g' $pkgdir/usr/share/omvviewer/app_settings/settings.xml
}
