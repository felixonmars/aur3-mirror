#Maintainer: flaminigo 

pkgname=maya2013sp1
pkgver=2013.0.1
pkgrel=1
pkgdesc="3D Animation, Visual Effects, and Compositing Software"
arch=('x86_64')
url="http://www.autodesk.com/maya"
license=('custom')
depends=('libgl' 'mesa' \
	'libxp' 'libxmu' 'libxpm' 'libxt' 'libxi' 'libxext' 'libx11' 'libxinerama' 'libxau' 'libxcb' \
	'gamin' 'audiofile' 'e2fsprogs' 'glibc' 'zlib' 'libsm' 'libice' 'openssl' \
	'tcsh' 'ttf-liberation' 'libpng12' 'libjpeg6' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi' \
	'libtiff3')
optdepends=('maya2013-docs: html documentation reference'
	'java-environment' 'python' 'gtk2' 'openal' 'qtwebkit')
makedepends=('rpmextract')
conflicts=(maya2012 maya2012-docs)
#sha1sums=('c204619ed70313219a240a58b8fbcddc6fad3fbc'
#	'e254411a94ba87f5721caf5a01cd3bdbfdb04e49')
sha1sums=('bb336a7bdd90a1c86bde502a47fb453d569d400e')
options=('!strip')
install=maya2013.install

build() {

  cd $srcdir
  echo "Downloading files..."
#  wget --referer="http://trial.autodesk.com" --content-disposition "http://trial.autodesk.com/SWDLDDLM/2013/MAYA/ESD/Autodesk_Maya_2013_English_Linux_64bit.tgz" 
  aria2c -s 10 -x 10 "http://download.autodesk.com/us/maya/service_packs/Autodesk_Maya_2013_SP1_English_Linux_64bit.tgz"
  
  echo "Extracting..."  
  
  tar -xvzf ${srcdir}/Autodesk_Maya_2013_SP1_English_Linux_64bit.tgz
  cd ${pkgdir}
#  rpmextract.sh ${srcdir}/adlmapps5-5.0.39-0.x86_64.rpm 
#  rpmextract.sh ${srcdir}/adlmflexnetclient-5.0.39-0.x86_64.rpm 
#  rpmextract.sh ${srcdir}/Maya2013_0_64-2013.0-198.x86_64.rpm

  rpmextract.sh ${srcdir}/Composite_2013-2013.0-2600.x86_64.rpm       
#  rpmextract.sh ${srcdir}/adlmflexnetserver-5.0.39-0.x86_64.rpm
  rpmextract.sh ${srcdir}/MatchMover2013_0_64-2013.0-1111.x86_64.rpm  
  rpmextract.sh ${srcdir}/autodesk.backburner.monitor-2012.1.0-425.i386.rpm
  rpmextract.sh ${srcdir}/Maya2013_0_64-2013.0-299.x86_64.rpm         
  rpmextract.sh ${srcdir}/backburner.sw.base-2013-1580.i386.rpm
  rpmextract.sh ${srcdir}/adlmapps5-5.0.39-0.x86_64.rpm               
  rpmextract.sh ${srcdir}/backburner_webmonitor.sw.base-2013-1580.i386.rpm
  rpmextract.sh ${srcdir}/adlmflexnetclient-5.0.39-0.x86_64.rpm



  install -Dm644 "$srcdir/EULA/All Other Countries.txt" ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  
}

package() {
  echo "Creating /var/flexlm..."
  # make sure /var/flexlm is world-writable. 
  mkdir -p ${pkgdir}/var/flexlm
  chmod ugo+w ${pkgdir}/var/flexlm
  
  echo "Deleting maya directory if it's a link..."
  # need to add links after install since you can't name links in the file list
  if test -L ${pkgdir}/usr/autodesk/maya2013-x64; then
      rm -f ${pkgdir}/usr/autodesk/maya2013-x64
  fi
  
  echo "Linking the maya directory..."
  # create the maya softlink if it doesn't exist
  cd ${pkgdir}/usr/autodesk
  ln -sf maya2013-x64 maya
  
  echo "Creating various binary links..."
  # update various softlinks
  cd ${pkgdir}/usr/autodesk/maya2013-x64/bin
  ln -sf maya2013 maya
  mkdir -p ${pkgdir}/usr/bin
  ln -sf /usr/autodesk/maya2013-x64/bin/maya2013 ${pkgdir}/usr/bin/maya
  ln -sf /usr/autodesk/maya2013-x64/bin/Render ${pkgdir}/usr/bin/Render
  ln -sf /usr/autodesk/maya2013-x64/bin/fcheck ${pkgdir}/usr/bin/fcheck
  ln -sf /usr/autodesk/maya2013-x64/bin/imgcvt ${pkgdir}/usr/bin/imgcvt
  
  # uncomment with 64-bit opa is available.
  #ln -sf opa ${pkgdir}/usr/autodesk/maya2012/bin/apcw
  
  # links for pcw
  
  echo "Linking desktop files..."
  # create softlinks for desktop
  mkdir -p ${pkgdir}/usr/share/applications
  ln -sf /usr/autodesk/maya2013-x64/desktop/Autodesk-Maya.desktop ${pkgdir}/usr/share/applications/Autodesk-Maya2013-x64.desktop
  mkdir -p ${pkgdir}/usr/share/desktop-directories
  ln -sf /usr/autodesk/maya2013-x64/desktop/Autodesk-Maya.directory ${pkgdir}/usr/share/desktop-directories/Autodesk-Maya2013-x64.directory
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/48x48/apps
  ln -sf /usr/autodesk/maya2013-x64/desktop/Maya.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/Maya2013.png

  #cd ${pkgdir}/usr/autodesk/maya2013-x64/lib
  # workaround the ssl dependency problem
  echo "Linking openssl library..."
  if ! [ -a ${pkgdir}/usr/autodesk/maya2013-x64/lib/libssl.so.6 ]
  then
    ln -s /usr/lib/libssl.so ${pkgdir}/usr/autodesk/maya2013-x64/lib/libssl.so.6 
    ln -s /usr/lib/libcrypto.so ${pkgdir}/usr/autodesk/maya2013-x64/lib/libcrypto.so.6
  fi	
  
  # update the mental ray configuration files in place
  #RPM_ESCAPED_PREFIX=`echo ${pkgdir}/usr | sed -e '/\//s/\//\\\\\//g'`

  #sed -e "/\[PREFIX\]/s//\/usr/" ${pkgdir}/usr/autodesk/maya2013-x64/mentalray/maya.rayrc > /tmp/maya.rayrc
  #sed -e "/\[PREFIX\]/s//\/usr/" ${pkgdir}/usr/autodesk/maya2013-x64/bin/mayaexport_with_mr > /tmp/mayaexport_with_mr
  #mv /tmp/maya.rayrc ${pkgdir}/usr/autodesk/maya2013-x64/mentalray/maya.rayrc
  #mv /tmp/mayarender_with_mr ${pkgdir}/usr/autodesk/maya2013-x64/bin/mayarender_with_mr


  #chmod 755 ${pkgdir}/usr/autodesk/maya2013-x64/bin/mayarender_with_mr > /dev/null 2>&1
  echo "Creating the synergy file..."
  instPath=/usr/autodesk/maya2013-x64/bin/maya
  RPM_INSTALL_PATH=`echo ${instPath} | sed -e '/\//s/\//\\\\\//g'`
  sed -e "/__EXECUTABLE_PATH__/s//${RPM_INSTALL_PATH}.bin\"\n      StartWrapperPath=\"${RPM_INSTALL_PATH}2012/" ${pkgdir}/opt/Autodesk/Synergy/Maya2013.2013.1.64.syncfg > ${pkgdir}/opt/Autodesk/Synergy/maya2013tmp.txt
  mv ${pkgdir}/opt/Autodesk/Synergy/maya2013tmp.txt ${pkgdir}/opt/Autodesk/Synergy/Maya2013.2013.1.64.syncfg

echo "Creating the /usr/tmp directory..."
  mkdir ${pkgdir}/usr/tmp
  chmod 777 ${pkgdir}/usr/tmp
}
