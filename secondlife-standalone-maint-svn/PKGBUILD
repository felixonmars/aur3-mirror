# Contributor: Lisa Denia <eiffel56@gmail.com>
pkgname=secondlife-standalone-maint-svn
pkgver=2384
pkgrel=1
_llmozlib2_revision=20090304prfhk
_slartwork_version="1.23.4-r124025"
pkgdesc="SecondLife stable viewer maintenance branch - built against system libraries"
arch=('i686' 'x86_64')
url="http://www.secondlife.com"
license=('GPL' 'other')
groups=()
depends=(openjpeg apr openal freealut apr-util c-ares libogg libvorbis vorbis-tools boost gstreamer0.10 
gstreamer0.10-base-plugins sdl dbus-glib xmlrpc-epi gtk2 nss mesa curl llmozlib2 ttf-dejavu)
makedepends=(python bison flex svn unzip)
source=(http://secondlife.com/developers/opensource/downloads/2009/06/slviewer-artwork-viewer-${_slartwork_version}.zip
  defaultsettings_use_dejavu.patch
  ignore_prebuilt_install_error.patch  
  llappviewerlinux-fix.patch
  nondofdev.patch  
  use-llmozlib2.patch
  link_against_system_mozlib.patch
  llxml_use_locale_c2.patch
  wrapper_always_use_gstreamer.patch
  secondlife.desktop)
noextract=(slviewer-artwork-viewer-${_slartwork_version}.zip)
md5sums=('89a93f48a25821a5d81176cf63f76288'
         'd30b95e92613f008a8b5eeac0b1555fe'
         '69bf63b87242a7ec89109b47bff78585'
         'a13dcedc7c8b425adbabed8dba51ed21'
         'a51bd04766bf1eedef4027f52e7d3154'
         'f68471c1704fe332e97c5a46ea47cebe'
         '9fd281afc228971edbc298ddcb280642'
         'b73ef9d9f1cd5a0af31e98c7e5c1b511'
         'c5a64b3afb2f0d3710f5e7c8d7eccfb6'
         'ae1c528b07f27f7daded3269de5ee644')

_svntrunk=http://svn.secondlife.com/svn/linden/branches/maint-viewer
_svnmod=maint-viewer

build() {
  cd "$srcdir/"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/linden"
  cp -r "$srcdir/$_svnmod" "$srcdir/linden"

  cd "$srcdir"
  unzip ${srcdir}/slviewer-artwork-viewer-${_slartwork_version}.zip || return 1

  cd linden

  # patch the source
  patch -p1 -i ${srcdir}/defaultsettings_use_dejavu.patch || return 1
  patch -p1 -i ${srcdir}/ignore_prebuilt_install_error.patch || return 1
  patch -p1 -i ${srcdir}/llappviewerlinux-fix.patch || return 1
  patch -p1 -i ${srcdir}/nondofdev.patch || return 1
  patch -p1 -i ${srcdir}/use-llmozlib2.patch || return 1
  patch -p2 -i ${srcdir}/link_against_system_mozlib.patch || return 1
  patch -p1 -i ${srcdir}/llxml_use_locale_c2.patch || return 1

  [ "$CARCH" == "x86_64" ] && (patch -p1 -i ${srcdir}/wrapper_always_use_gstreamer.patch || return 1) # If we are going to build for x86_64, we can ignore this check safely

  # build

  [ "$CARCH" == "x86_64" ] && _archflag="-m64"
  cd indra
  ./develop.py ${_archflag} --standalone --type Release configure -DMOZLIB:BOOL=ON -DGCC_DISABLE_FATAL_WARNINGS:BOOL=ON -DCMAKE_CXX_FLAGS:STRING="-fpermissive -Wno-deprecated -Wno-parentheses" || return 1
  cd viewer-linux-${CARCH}-release
  make || return 1
  mkdir -p $pkgdir/opt/secondlife
  cp -R newview/packaged/* $pkgdir/opt/secondlife

  # copy desktop file
  install -D -m 755 $srcdir/secondlife.desktop $pkgdir/usr/share/applications/secondlife.desktop  || return 1
}

# vim:set ts=2 sw=2 et:
