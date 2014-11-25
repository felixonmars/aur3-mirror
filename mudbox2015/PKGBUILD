# Maintainer: Sean Mills <mills dot sean at gmail dot com>
 
pkgname=mudbox2015
pkgver=2015.0.0sp1
pkgrel=1
pkgdesc="Professional digital sculpting and painting toolset"
arch=('x86_64')
url="http://www.autodesk.com/mudbox"
license=('custom')
depends=('libgl' 'mesa' \
	'libxp' 'libxmu' 'libxt' 'libxi' 'libxext' 'libx11' 'libxinerama' 'libxau' 'libxcb' \
	'glibc' 'zlib' 'libsm' 'libice' 'openssl' 'libpng12' 'libjpeg6' 'libtiff3' 'phonon' \
	'adlmflexnetclient9' 'adlmapps9'  'xorg-fonts-100dpi' 'xorg-fonts-75dpi')
optdepends=('java-environment' 'python' 'gtk2' 'openal' 'qtwebkit' 'glu' 'adlmflexnetserver')
makedepends=('rpmextract')
source=(http://download.autodesk.com/us/support/files/mudbox_2015_sp1/Autodesk_Mudbox_2015_SP1_EFGJ_Linux_64bit.tgz)
#source=(/home/sean/Desktop/mudbox2015sp1/Autodesk_Mudbox_2015_SP1_EFGJ_Linux_64bit.tgz)
sha1sums=('bac4d964f31f50ee9df855f8d2eb852965e29a45')
options=('!strip')
install=mudbox2015.install

package() {
  cd ${pkgdir}
  
  rpmextract.sh ${srcdir}/Mudbox2015_0_64-2015.0-105.${CARCH}.rpm 
  
  install -Dm644 "${srcdir}/EULA/English.txt" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  
  echo "Deleting mudbox directory if it's a link..."
  [[ -L ${pkgdir}/usr/autodesk/${pkgname} ]] && rm -f ${pkgdir}/usr/autodesk/${pkgname}
  
  echo "Linking the mudbox directory..."
  # create the maya softlink if it doesn't exist
  cd ${pkgdir}/usr/autodesk
  ln -sf ${pkgname} mudbox
  
  echo "Creating the binary link..."
  cd ${pkgdir}/usr/autodesk/${pkgname}/bin 
  ln -sf ${pkgname} mudbox
  mkdir -p ${pkgdir}/usr/bin 
  ln -sf /usr/autodesk/${pkgname}/bin/${pkgname} ${pkgdir}/usr/bin/mudbox
  
  echo "Linking desktop files..."
  # create softlinks for desktop  
  mkdir -p ${pkgdir}/usr/share/applications
  ln -sf /usr/autodesk/${pkgname}/desktop/Autodesk-Mudbox.desktop ${pkgdir}/usr/share/applications/Autodesk-Mudbox2015-x64.desktop
  mkdir -p ${pkgdir}/usr/share/desktop-directories
  ln -sf /usr/autodesk/${pkgname}/desktop/Autodesk-Mudbox.directory ${pkgdir}/usr/share/desktop-directories/Autodesk-Mudbox2015-x64.directory
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/32x32/apps
  ln -sf /usr/autodesk/${pkgname}/bin/Icons/appIcon.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/Mudbox2015.png
  ln -sf /usr/autodesk/${pkgname}/desktop/Mudbox2015.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/Mudbox2015.png
  
  echo "Linking openssl library..."
  if ! [ -a ${pkgdir}/usr/autodesk/${pkgname}/lib/libssl.so.10 ]; then
    ln -s /usr/lib/libssl.so ${pkgdir}/usr/autodesk/${pkgname}/lib/libssl.so.10
    ln -s /usr/lib/libcrypto.so ${pkgdir}/usr/autodesk/${pkgname}/lib/libcrypto.so.10
  fi
  
  echo "Creating the synergy file..."
  RPM_INSTALL_PATH=`echo "/usr/autodesk/${pkgname}/bin/mudbox2015" | sed -e '/\//s/\//\\\\\//g'`
  sed -e "/__EXECUTABLE_PATH__/s//${RPM_INSTALL_PATH}\" /" ${pkgdir}/opt/Autodesk/Synergy/Mudbox.2015.0.Linux.64.syncfg > ${pkgdir}/opt/Autodesk/Synergy/${pkgname}tmp.txt
  mv ${pkgdir}/opt/Autodesk/Synergy/${pkgname}tmp.txt ${pkgdir}/opt/Autodesk/Synergy/Mudbox.2015.0.Linux.64.syncfg

  echo "Removing conflicting files..."
  # This files will conflict with the ones at /var/opt/Autodesk/Adlm/ASR/, which belong to maya2015 but they're the exact same ones (compared using diff)
  
  if [ -d /var/opt/Autodesk/Adlm/ASR ]; then
	cd ${pkgdir}/var/opt/Autodesk/Adlm/ASR/
	mkdir bck
	for _i in *; do
		if [ -f /var/opt/Autodesk/Adlm/ASR/$_i ]; then
		    mv $_i bck
		fi
	done
  
  fi

  echo "Creating the /usr/tmp directory..."
  if [ ! -e /usr/tmp ]; then
	ln -s /tmp ${pkgdir}/usr/tmp && chmod 755 ${pkgdir}/usr/tmp
  fi
}
