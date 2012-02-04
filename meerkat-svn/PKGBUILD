# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=meerkat-svn
pkgver=213
pkgrel=1
pkgdesc="Meerkat is a fully open source fork of the Second Life viewer."
arch=('i686' 'x86_64')
url="http://meerkatviewer.org/"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gtk2' 'libgl' 'libidn' 'mesa' 'nss' 'sdl' 'openjpeg' 'xmlrpc-epi' 'c-ares' 'ttf-dejavu' 'ndofdev')
makedepends=('git' 'gcc' 'make' 'patch' 'quilt' 'python' 'bison' 'flex' 'cmake' 'boost')
source=('meerkat.desktop' 'meerkat-256.png' 'fix_font_settings.patch')
optdepends=('gstreamer0.10: in-world movie playback')
md5sums=('70b99da5dbbd73e2cf980f523b3c2800'
         '66b0582dfad3d537c9eb7343febfc9c3'
         'b79248f0602aa75cdf5360b0f07d2aae')

_svntrunk=http://svn.meerkatviewer.org/svn/trunk/
_svnmod=meerkat

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
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
  -DAPP_SHARE_DIR:STRING=/usr/share/meerkat \
  -DAPP_BINARY_DIR:STRING=/usr/bin \
  -DVIEWER_BINARY_NAME:STRING=meerkat-bin \
  -DOPENAL:BOOL=TRUE \
  -DGCC_DISABLE_FATAL_WARNINGS:BOOL=TRUE \
  .. || return 1

  # Make and Install
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  # Install Desktop File
  install -D -m644 $srcdir/meerkat.desktop \
      $pkgdir/usr/share/applications/meerkat.desktop

  # Install Icon File
  install -D -m644 $srcdir/meerkat-256.png \
      $pkgdir/usr/share/pixmaps/meerkat-256.png

  # Fix the font config which points to the font file which is not exist in arch system.
      patch $pkgdir/usr/share/meerkat/app_settings/settings.xml < $srcdir/fix_font_settings.patch
}
