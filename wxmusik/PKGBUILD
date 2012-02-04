# Maintainer kfgz <kfgz at interia pl>

pkgname=wxmusik
pkgver=348
pkgrel=1
pkgdesc="An iTunes-like music jukebox, supporting cross-fadding, 16-band dual-channel equalizer, auto-tagging and fuzzy search."
url="http://musik.berlios.de/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('faad2' 'flac' 'fmodex' 'libmpcdec' 'libsm' 'libtiff' 'libxxf86vm' 'mac' 'wxgtk')
optdepends=('lastfmsubmitd: last.fm scrobbling support')
makedepends=('cmake' 'subversion')
provides=('wxmusik')

_svntrunk=svn://svn.berlios.de/musik
_svnmod=musik

# wxMusik compiling doc ==> http://musik.berlios.de/?id=compileonlin

build() {
	
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cd ${_svnmod}/trunk/wxMusik
  mkdir crelbuild
  cd crelbuild

  #ccmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo -DFMOD_LIBRARY=/usr/lib/libfmodex.so
  cmake .. \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
          -DFMOD_LIBRARY=/usr/lib/libfmodex.so \
          -OPTION_SUPPORT_APE:BOOL=ON \
          -OPTION_SUPPORT_FLAC:BOOL=ON \
          -OPTION_SUPPORT_MPC:BOOL=ON \
          -OPTION_SUPPORT_FAAD2:BOOL=ON \
          -DWXWINDOWS_USE_SHARED_LIBS:BOOL=ON

  make
  
  make DESTDIR=${pkgdir} install
  rm -r ${pkgdir}/usr/lib
  rm ${pkgdir}/usr/share/locale/cs/LC_MESSAGES/wxstd.mo
  rm ${pkgdir}/usr/share/locale/de/LC_MESSAGES/wxstd.mo
  rm ${pkgdir}/usr/share/locale/es/LC_MESSAGES/wxstd.mo
  rm ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/wxstd.mo
  rm ${pkgdir}/usr/share/locale/it/LC_MESSAGES/wxstd.mo
  rm ${pkgdir}/usr/share/locale/nl/LC_MESSAGES/wxstd.mo
  rm ${pkgdir}/usr/share/locale/pl/LC_MESSAGES/wxstd.mo
  rm ${pkgdir}/usr/share/locale/ru/LC_MESSAGES/wxstd.mo
  #rm -rf ${srcdir}
}

