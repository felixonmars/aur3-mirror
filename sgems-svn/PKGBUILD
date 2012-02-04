# Maintainer: Dominik Fuchs <dominik.fuchs@wur.nl>

pkgname=sgems-svn
pkgver=117
pkgrel=2
pkgdesc="Stanford Geostatistical Modeling Software (svn version)"
url="http://sgems.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('boost' 'python' 'qt' 'simvoleon-mercurial')
makedepends=('cvs' 'svn')
options=('!makeflags')
source=(sgems.png
	sgems-svn.desktop
    sgems-launcher.sh)
md5sums=('fef1c26239b9b5d5e09316f6af9b7d06'
         '6c7953be18e124e0eac6f0f947f8b660'
         '98ebdbea8ce7dfa843cdc5b1fc919a03')
_svntrunk=https://sgems.svn.sourceforge.net/svnroot/sgems
_svnmod=sgems

build() {

  cd "${srcdir}"

  msg "Downloading GsTL sources..."
  if [ -d GsTL/CVS ]; then
    cd GsTL
    cvs -z3 update -d
  else
    cvs -z3 -d:pserver:anonymous@gstl.cvs.sourceforge.net:/cvsroot/gstl co -P GsTL
  fi

  cd "${srcdir}"
  rm -rf "${srcdir}/GsTL-build"
  cp -r GsTL GsTL-build
  rm -rf "${srcdir}/GsTL-build/boost"
  sed 's:Common/ExceptionStandard.h:GsTL/utils/Common/ExceptionStandard.h:g' -i ${srcdir}/GsTL-build/GsTL/utils/Common/CommonDefs.h
  sed 's:Common/CommonDefs.h:GsTL/utils/Common/CommonDefs.h:g' -i ${srcdir}/GsTL-build/GsTL/utils/Common/CGLA.h

  msg "Downloading SGEMS sources..."
  # get SGEMS itself
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r ${_svnmod}/trunk ${_svnmod}-build
  
  # qmake setup
  cd ${srcdir}/${_svnmod}-build
  sed "s:GSTLHOME = /home/aboucher/data/code-dev/linux/GsTL:GSTLHOME = ${srcdir}/GsTL-build:g" -i .qmake.cache
  sed "s:GSTLAPPLI_HOME =  /home/aboucher/data/code-dev/linux/sgems:GSTLAPPLI_HOME = ${srcdir}/${_svnmod}-build:g" -i .qmake.cache  
  sed "s:debug warn_on:release warn_on:g" -i .qmake.cache

  # configure & make
  qmake
  make || return 1

  # install to /opt/sgems
  install -m755 -d ${pkgdir}/opt/sgems/{bin,lib}
  install -m755 ${srcdir}/${_svnmod}-build/bin/linux/sgems ${pkgdir}/opt/sgems/bin
  install -m755 ${srcdir}/${_svnmod}-build/lib/linux/* ${pkgdir}/opt/sgems/lib
  cp -R ${srcdir}/${_svnmod}-build/plugins ${pkgdir}/opt/sgems/plugins
  cp -R ${srcdir}/${_svnmod}-build/doc ${pkgdir}/opt/sgems/doc

  # install launcher script, desktop entry and icon
  install -m755 -d ${pkgdir}/usr/{bin,share}
  install -m755 -D $startdir/sgems-launcher.sh ${pkgdir}/opt/sgems/sgems-launcher.sh
  ln -sf /opt/sgems/sgems-launcher.sh $startdir/pkg/usr/bin/sgems
  install -m644 -D $startdir/sgems-svn.desktop ${pkgdir}/usr/share/applications/sgems-svn.desktop
  install -m644 -D $startdir/sgems.png ${pkgdir}/usr/share/icons/sgems-svn.png

}

