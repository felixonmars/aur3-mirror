# Maintainer: Francisco Martinez <niteiat at gmail dot com>
# Maintainer: Félix Pelletier <felixpelletier23 at gmail dot com>

pkgname=maya2014
pkgver=2014.0.0sp4
pkgrel=2
pkgdesc="3D Animation, Visual Effects, and Compositing Software"
arch=('x86_64')
url="http://www.autodesk.com/maya"
license=('custom')
depends=('libgl' 'mesa' 'libxp' 'libxmu' 'libxpm' 'libxt' 'libxi' 'libxext' 'libx11' 'libxinerama' \
	'libxau' 'libxcb' 'gamin' 'audiofile' 'e2fsprogs' 'glibc' 'zlib' 'libsm' 'libice' \
	'openssl' 'tcsh' 'libpng12' 'libjpeg6' 'libtiff3' 'phonon' 'ffmpeg' 'openssl098' 'glu'
	'adlmflexnetclient' 'adlmapps7' 'lib32-glibc' 'libxslt' 'intel-tbb' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi')
optdepends=('java-environment' 'python' 'gtk2' 'openal' 'qtwebkit' 'adlmflexnetserver')
makedepends=('rpmextract')
source=(http://download.autodesk.com/us/support/files/maya_2014_service_pack4/Autodesk_Maya_2014sp4_English_Linux_64bit.gz
	$pkgname.sh)
sha1sums=('69fdf236f4bcceafa213803a2cc19cbcc31e0bad'
          '1542d73c684487911684638302332c826e921a09')
options=('!strip')
install=maya2014.install

package() {
    cd ${pkgdir}
    rpmextract.sh ${srcdir}/Maya2014_64-2014.0-986.${CARCH}.rpm
    rpmextract.sh ${srcdir}/mentalrayForMaya2014_0-2014.0-418.${CARCH}.rpm

    install -Dm755 "$srcdir/$pkgname.sh" etc/profile.d/$pkgname.sh
    
    install -Dm644 "$srcdir/EULA/English.txt" ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
    
   echo "Creating /var/flexlm..."
#   # make sure /var/flexlm is world-writable. 
   mkdir -p ${pkgdir}/var/flexlm
   chmod ugo+w ${pkgdir}/var/flexlm
  
  echo "Creating /var/flexlm..."
#   # make sure /var/flexlm is world-writable. 
  mkdir -p ${pkgdir}/var/flexlm
  chmod ugo+w ${pkgdir}/var/flexlm

  
  echo "Deleting maya directory if it's a link..."
  # need to add links after install since you can't name links in the file list
  if [ -L ${pkgdir}/usr/autodesk/${pkgname}-x64 ]; then
      rm -f ${pkgdir}/usr/autodesk/${pkgname}-x64
  fi
  
  echo "Linking the maya directory..."
  # create the maya softlink if it doesn't exist
  cd ${pkgdir}/usr/autodesk
  ln -sf ${pkgname}-x64 maya
  
  echo "Creating various binary links..."
  # update various softlinks
  cd ${pkgdir}/usr/autodesk/${pkgname}-x64/bin
  ln -sf ${pkgname} maya
  mkdir -p ${pkgdir}/usr/bin
  ln -sf /usr/autodesk/${pkgname}-x64/bin/${pkgname} ${pkgdir}/usr/bin/maya
  ln -sf /usr/autodesk/${pkgname}-x64/bin/Render ${pkgdir}/usr/bin/Render
  ln -sf /usr/autodesk/${pkgname}-x64/bin/fcheck ${pkgdir}/usr/bin/fcheck
  ln -sf /usr/autodesk/${pkgname}-x64/bin/imgcvt ${pkgdir}/usr/bin/imgcvt
  
  echo "Linking mentalray..."
  ln -sf /usr/autodesk/mentalrayForMaya2014/ ${pkgdir}/usr/autodesk/modules/maya/2014/\<MENTALRAY_DIR\>
  # uncomment with 64-bit opa is available.
  #ln -sf opa ${pkgdir}/usr/autodesk/${pkgname}/bin/apcw
  
  # links for pcw
  
  echo "Linking desktop files..."
  # create softlinks for desktop
  mkdir -p ${pkgdir}/usr/share/applications
  ln -sf /usr/autodesk/${pkgname}-x64/desktop/Autodesk-Maya.desktop ${pkgdir}/usr/share/applications/Autodesk-Maya2014-x64.desktop
  mkdir -p ${pkgdir}/usr/share/desktop-directories
  ln -sf /usr/autodesk/${pkgname}-x64/desktop/Autodesk-Maya.directory ${pkgdir}/usr/share/desktop-directories/Autodesk-Maya2014-x64.directory
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/48x48/apps
  ln -sf /usr/autodesk/${pkgname}-x64/icons/mayaico.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/Maya2014.png
  
  #cd ${pkgdir}/usr/autodesk/${pkgname}-x64/lib
  # workaround the ssl dependency problem
  
  echo "Linking openssl library..."
  if ! [ -a ${pkgdir}/usr/autodesk/${pkgname}-x64/lib/libssl.so.10 ]
  then
    ln -s /usr/lib/libssl.so ${pkgdir}/usr/autodesk/${pkgname}-x64/lib/libssl.so.10
    ln -s /usr/lib/libcrypto.so ${pkgdir}/usr/autodesk/${pkgname}-x64/lib/libcrypto.so.10
  fi
  
  # update the mental ray configuration files in place
  #RPM_ESCAPED_PREFIX=`echo ${pkgdir}/usr | sed -e '/\//s/\//\\\\\//g'`

  #sed -e "/\[PREFIX\]/s//\/usr/" ${pkgdir}/usr/autodesk/${pkgname}-x64/mentalray/maya.rayrc > /tmp/maya.rayrc
  #sed -e "/\[PREFIX\]/s//\/usr/" ${pkgdir}/usr/autodesk/${pkgname}-x64/bin/mayaexport_with_mr > /tmp/mayaexport_with_mr
  #mv /tmp/maya.rayrc ${pkgdir}/usr/autodesk/${pkgname}-x64/mentalray/maya.rayrc
  #mv /tmp/mayarender_with_mr ${pkgdir}/usr/autodesk/${pkgname}-x64/bin/mayarender_with_mr
  
  #chmod 755 ${pkgdir}/usr/autodesk/${pkgname}-x64/bin/mayarender_with_mr > /dev/null 2>&1
  
  echo "Creating the synergy file..."
  RPM_INSTALL_PATH=`echo "/usr/autodesk/${pkgname}-x64/bin/maya" | sed -e '/\//s/\//\\\\\//g'`
  sed -e "/__EXECUTABLE_PATH__/s//${RPM_INSTALL_PATH}.bin\"\n      StartWrapperPath=\"${RPM_INSTALL_PATH}2014/" ${pkgdir}/opt/Autodesk/Synergy/Maya2014.2014.1.64.syncfg > ${pkgdir}/opt/Autodesk/Synergy/${pkgname}tmp.txt
  mv ${pkgdir}/opt/Autodesk/Synergy/${pkgname}tmp.txt ${pkgdir}/opt/Autodesk/Synergy/Maya2014.2014.1.64.syncfg
  
  echo "Creating the /usr/tmp directory..."
  ln -s /tmp ${pkgdir}/usr/tmp && chmod 777 ${pkgdir}/usr/tmp
  
}
