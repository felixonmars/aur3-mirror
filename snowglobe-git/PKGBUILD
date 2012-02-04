# Maintainer: Splex

pkgname=snowglobe-git
pkgver=20111031
pkgrel=1
pkgdesc="Open Metaverse Viewer is a client for connecting to 3D virtual worlds such as SecondLife(tm) or servers operating the OpenSim package."
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/"
license=('GPL')
depends=('openjpeg' 'xmlrpc-epi' 'boost-libs' 'freealut' 'jsoncpp-stable' 'apr-util' 'llqtwebkit-git' 'gtk2' 'libvorbis' 'sdl' 'ndofdev' 'curl' 'c-ares' 'mesa' 'ttf-liberation' 'libpng' 'libtut-svn')
makedepends=('git' 'gcc' 'make' 'patch' 'python' 'bison' 'flex' 'cmake' 'boost')
provides=('snowglobe')
source=('archfix.diff'
         'sdl-cursors.tar.bz')
md5sums=('18a8392c8e08ec4953795d4852ade571'
         '8e560dc089ce60c105537f51f39967e4')
optdepends=('gstreamer0.10: in-world movie playback')

_gitroot="git://git.byteme.org.uk/home/git/snowglobe.git"
_gitname="snowglobe"

build() {
  cd $srcdir
  msg "Connecting to GIT server..."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout."

  msg "Resetting local GIT source to clean state..."
  cd $srcdir/$_gitname
  rm -Rf trunk
  git reset --hard

  cd trunk
  msg "Applying Arch Linux Fixes..."
  patch -p2 < $srcdir/archfix.diff

  sed -i 's|/usr/bin/python$|/usr/bin/python2|g' scripts/*.py

  msg "Starting make..."
  cd indra
  cmake -DUNATTENDED:BOOL=FALSE \
        -DSTANDALONE:BOOL=TRUE \
        -DCMAKE_BUILD_TYPE:STRING=RELWITHDEBINFO \
		  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DSERVER:BOOL=FALSE \
        -DCMAKE_CURRENT_BINARY_DIR:STRING= \
        -DVIEWER:BOOL=TRUE \
        -DMOZLIB:BOOL=TRUE \
        -DINSTALL:BOOL=TRUE \
        -DAPP_SHARE_DIR:STRING=/usr/share/snowglobe/ \
        -DAPP_BINARY_DIR:STRING=/usr/bin/ \
        -DVIEWER_BINARY_NAME:STRING=snowglobe \
        -DOPENAL:BOOL=TRUE \
		  -DPACKAGE:BOOL=FALSE \
		  -DGCC_DISABLE_FATAL_WARNINGS:BOOL=TRUE \
		  -DCMAKE_CXX_FLAGS="-fpermissive" \
		  .

  make || return 1
}

package() {
  cd $srcdir/$_gitname/trunk/indra
  make DESTDIR=$pkgdir install || return 1

  # Install LLMedia Plugins
  install -D -m755 $srcdir/$_gitname/trunk/indra/llplugin/slplugin/SLPlugin $pkgdir/usr/bin/SLPlugin

  if [[ -f $srcdir/$_gitname/trunk/indra/media_plugins/gstreamer010/libmedia_plugin_gstreamer010.so ]]; then
    install -D -m644 $srcdir/$_gitname/trunk/indra/media_plugins/gstreamer010/libmedia_plugin_gstreamer010.so \
      $pkgdir/usr/lib/snowglobe-plugins/libmedia_plugin_gstreamer010.so
  fi

  if [[ -f $srcdir/$_gitname/trunk/indra/media_plugins/webkit/libmedia_plugin_webkit.so ]]; then
    install -D -m644 $srcdir/$_gitname/trunk/indra/media_plugins/webkit/libmedia_plugin_webkit.so \
      $pkgdir/usr/lib/snowglobe-plugins/libmedia_plugin_webkit.so
  fi

  # Fix: create mime_types.xml from mime_types_linux.xml
  install -D -m644 $srcdir/$_gitname/trunk/indra/newview/skins/default/xui/en-us/mime_types_linux.xml $pkgdir/usr/share/snowglobe/skins/default/xui/en-us/mime_types.xml

  # Install misc
  install -D -m644 $srcdir/$_gitname/trunk/etc/message.xml \
    $pkgdir/usr/share/snowglobe/app_settings/message.xml
  install -D -m644 $srcdir/$_gitname/trunk/indra/newview/linux_tools/launch_url.sh \
    $pkgdir/usr/share/snowglobe/launch_url.sh

  # Install Desktop File
  install -D -m644 $srcdir/$_gitname/trunk/debian/snowglobe.desktop \
    $pkgdir/usr/share/applications/snowglobe.desktop

  # Install Icon File
  install -D -m644 $srcdir/$_gitname/trunk/debian/snowglobe_icon.xpm \
    $pkgdir/usr/share/pixmaps/snowglobe_icon.xpm

  # Install Cursors BMPs for SDL
  mkdir -p $pkgdir/usr/share/snowglobe/res-sdl
  install -D -m755 $srcdir/res-sdl/* \
    $pkgdir/usr/share/snowglobe/res-sdl/

  # Unescape any unescaped filenames
  cd $pkgdir
  for filename in `find . | grep %`; do
    newname=`echo $filename | sed -e 's/%21/!/g' -e 's/%20/\ /g' -e "s/%27/'/g" -e 's/%2D/-/g'`; mv "$filename" "$newname";
  done
}

# vim:set ts=2 sw=2 et:
