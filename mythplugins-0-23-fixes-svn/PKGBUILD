# Maintainer: leprechau <ahurt@anbcs.com>
# Contributer: Giovanni Scafora <giovanni@archlinux.org>

pkgbase=mythplugins-0-23-fixes-svn
pkgname=${pkgbase}

#######################################################
#### Uncomment the 'pkgname' array before building ####
#######################################################

#pkgname=('mythplugins-mytharchive'
#         'mythplugins-mythbrowser'
#         'mythplugins-mythgallery'
#         'mythplugins-mythgame'
#         'mythplugins-mythmovies'
#         'mythplugins-mythmusic'
#         'mythplugins-mythnetvision'
#         'mythplugins-mythnews'
#         'mythplugins-mythvideo'
#         'mythplugins-mythweather'
#         'mythplugins-mythweb'
#         'mythplugins-mythzoneminder')

##############
## END EDIT ##
##############

pkgver=25190
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.mythtv.org"
license=('GPL')
makedepends=('mythtv-0-23-fixes-svn' 'mplayer' 'fftw' 'dvdauthor' 'libexif' 
             'python-imaging' 'libcdaudio' 'taglib' 'perl-xml-simple' 
             'libvisual' 'subversion')
source=('mtd')
md5sums=('476c12ba074794ad7f4ae092bdf949d6')

_svntrunk=http://svn.mythtv.org/svn/branches/release-0-23-fixes/mythplugins
_svnmod=${pkgbase}

build() {
  if [ ${pkgname} == ${pkgbase} ]; then
    msg ""
    msg "######################################################"
    msg "## You did not edit the PKGBUILD, please do so now! ##"
    msg "######################################################"
    msg ""
    exit 1
  fi

  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  ARCH=${CARCH/_/-}

  msg "SVN checkout complete or server timeout"
  msg "Starting configure and make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  ./configure --prefix=/usr \
              --enable-all

  qmake mythplugins.pro || return 1
  make || return 1
}

package_mythplugins-mytharchive() {
  pkgdesc="MythTV plugin that lets you create DVDs from or archive your recorded shows"
  depends=('mythtv-0-23-fixes-svn' 'libxmu' 'pil' 'dvdauthor')
  replaces=('mytharchive')
  conflicts=('mytharchive')
  provides=('mytharchive')
  cd "${srcdir}/${_svnmod}-build/mytharchive"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythbrowser() {
  pkgdesc="Mini web browser for MythTV"
  depends=('mythtv-0-23-fixes-svn')
  replaces=('mythbrowser')
  conflicts=('mythbrowser')
  provides=('mythbrowser')
  cd "${srcdir}/${_svnmod}-build/mythbrowser"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythgallery() {
  pkgdesc="Image gallery plugin for MythTV"
  depends=('mythtv-0-23-fixes-svn' 'libexif')
  replaces=('mythgallery')
  conflicts=('mythgallery')
  provides=('mythgallery')
  cd "${srcdir}/${_svnmod}-build/mythgallery"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythgame() {
  pkgdesc="Game emulator module for MythTV"
  depends=('mythtv-0-23-fixes-svn' 'zlib')
  replaces=('mythgame')
  conflicts=('mythgame')
  provides=('mythgame')
  cd "${srcdir}/${_svnmod}-build/mythgame"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythmovies() {
  pkgdesc="Local movie listings via MythTV"
  depends=('mythtv-0-23-fixes-svn')
  replaces=('mythmovies')
  conflicts=('mythmovies')
  provides=('mythmovies')
  cd "${srcdir}/${_svnmod}-build/mythmovies"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythmusic() {
  pkgdesc="Music playing plugin for MythTV"
  depends=('mythtv-0-23-fixes-svn' 'flac' 'libcdaudio' 'cdparanoia' 'taglib' 'libvisual')
  replaces=('mythmusic')
  conflicts=('mythmusic')
  provides=('mythmusic')
  cd "${srcdir}/${_svnmod}-build/mythmusic"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythnetvision() {
  pkgdesc="Internet video plugin for MythTV"
  depends=('mythtv-0-23-fixes-svn' 'python-pycurl' 'flashplugin')
  replaces=('mythnetvision')
  conflicts=('mythnetvision')
  provides=('mythnetvision')
  cd "${srcdir}/${_svnmod}-build/mythnetvision"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythnews() {
  pkgdesc="News checking plugin for MythTV"
  depends=('mythtv-0-23-fixes-svn')
  replaces=('mythnews')
  conflicts=('mythnews')
  provides=('mythnews')
  cd "${srcdir}/${_svnmod}-build/mythnews"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythvideo() {
  pkgdesc="Video playback and browsing plugin for MythTV"
  depends=('mythtv-0-23-fixes-svn' 'mplayer' 'perl-xml-simple')
  replaces=('mythvideo')
  conflicts=('mythvideo')
  provides=('mythvideo')
  cd "${srcdir}/${_svnmod}-build/mythvideo"
  make INSTALL_ROOT="${pkgdir}" install || return 1
  install -D -m755 ${startdir}/mtd "${pkgdir}/etc/rc.d/mtd" || return 1
}

package_mythplugins-mythweather() {
  pkgdesc="Weather checking plugin for MythTV"
  depends=('mythtv-0-23-fixes-svn')
  replaces=('mythweather')
  conflicts=('mythweather')
  provides=('mythweather')
  cd "${srcdir}/${_svnmod}-build/mythweather"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

package_mythplugins-mythweb() {
  pkgdesc="Web interface for MythTV's backend"
  depends=('mythtv-0-23-fixes-svn')
  optdepends=('php-apache' 'lighttpd')
  replaces=('mythweb')
  conflicts=('mythweb')
  provides=('mythweb')
  mkdir -p ${pkgdir}/srv/http/mythweb/{image_cache,php_sessions}
  cp -r ${srcdir}/${_svnmod}-build/mythweb/* ${pkgdir}/srv/http/mythweb
  chown -R http:http ${pkgdir}/srv/http/mythweb
  chmod g+rw ${pkgdir}/srv/http/mythweb/{image_cache,php_sessions,data}
}

package_mythplugins-mythzoneminder() {
  pkgdesc="Allows for viewing of CCTV cameras through zoneminder"
  depends=('mythtv-0-23-fixes-svn')
  replaces=('mythzoneminder')
  conflicts=('mythzoneminder')
  provides=('mythzoneminder')
  install=mythplugins-mythzoneminder.install
  cd "${srcdir}/${_svnmod}-build/mythzoneminder"
  make INSTALL_ROOT="${pkgdir}" install || return 1
}

pkgdesc="Plugins for MythTV to enhance your experience"
