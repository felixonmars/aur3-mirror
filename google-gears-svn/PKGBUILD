# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: tuxce <tuxce.net@gmail.com>

pkgname=google-gears-svn
pkgver=3423
pkgrel=1
pkgdesc="Open source project that enables more powerful web applications, by adding new features to web browsers."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gears/"
license=('GPL')
depends=( 'xulrunner>=1.9.2' 'xulrunner<=1.9.3' 'firefox>=3.6' 'gcc-libs')
makedepends=('subversion' 'zip')
source=('arch64-r3423.patch')
md5sums=('9ff5ee95ca241ff20ba5126dff0ce521')

_svntrunk=http://gears.googlecode.com/svn/trunk
_svnmod=gears

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    cd ${_svnmod}
    # Too boring copy +600MB just cleanup it by hand :)
    msg "Cleanuping source tree from previous building..."
    svn revert -R .
    msg "Updating source tree..."
    svn up -r ${pkgver}
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"

  cd "${srcdir}/${_svnmod}"
  msg "Patching..."  
  patch -p0 < ${srcdir}/arch64-r3423.patch || return 1

  cd gears
  msg "Starting make..."  
  make BROWSER=FF36 || return 1
  make installers BROWSER=FF36 || return 1  
      
  _ext_guid=`sed -n '60 s|.*<em:id>\({.*}\)</em:id>.*|\1|p'\
                    "${srcdir}/${_svnmod}/gears/base/firefox/install.rdf.m4"`
  [ $CARCH = "i686" ] && _CARCH=i386 || _CARCH=x86_64
  _ext_ver=`sed -n 's|.*PRODUCT_VERSION_STRING_ASCII.*"\(.*\)".*|\1|p'\
                    "${srcdir}/${_svnmod}/gears/bin-opt/linux-${_CARCH}/common/genfiles/product_constants.h"`
  _ext_dir="${pkgdir}/usr/lib/firefox-3.6/extensions/${_ext_guid}"
  install -d ${_ext_dir}
  
  #msg "Extension version ${_ext_ver}"                  
  #msg "Extension will be installed with GUID ${_ext_guid}"
  [ $CARCH = "x86_64" ] && 
  bsdtar -xf "${srcdir}/${_svnmod}/gears/bin-opt/installers/gears-linux-${CARCH}-opt-${_ext_ver}.xpi"\
             -C "${_ext_dir}" ||
  bsdtar -xf "${srcdir}/${_svnmod}/gears/bin-opt/installers/gears-linux-opt-${_ext_ver}.xpi"\
             -C "${_ext_dir}" 
             
  msg "Cleanuping..."
  find "${pkgdir}" -type d -exec chmod 755 -- '{}' \;
  find "${pkgdir}" -type f -exec chmod 644 -- '{}' \;
  find "${pkgdir}" -name '*.so*' -exec chmod 755 -- '{}' \;
  find "${pkgdir}" -name '.svn'|xargs rm -rf
}

# vim:set ts=2 sw=2 et:
