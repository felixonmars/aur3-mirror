# Maintainer: Stephen Zhang <zsrkmyn@gmail.com>
pkgname=quartus-subscription
pkgver=13.1.4.182
pkgrel=1
pkgdesc="Quartus II Subscription Edition design software for Altera FPGA's, with no devices"
arch=('x86_64' 'i686')
url="http://www.altera.com"
license=('custom')
install=quartus.install
conflicts=('quartus-free' 'quartus-free130')
provides=('quartus-free')

_alteradir="/opt/altera"

# According to the installer script, these dependencies are needed for the installer
if [[ $CARCH = i686 ]]
then
	depends=('glibc' 'libxext' 'libx11' 'libxau' 'libutil-linux'
		'libxdmcp' 'freetype2' 'fontconfig' 'expat' 'libpng12' 
		'libstdc++5' 'ncurses' 'libcanberra' 'libsm' 'libice'
		'zlib' 'libxft' 'libxt' 'libxrender' 'libxft')
	optdepends=('gtk: For eclipse-nios2 support'
		'libxtst: For eclipse-nios2 support')
	makedepends=('fakeroot')
fi

if [[ $CARCH = x86_64 ]]
then
	depends=('lib32-glibc' 'lib32-libxext' 'lib32-libx11' 
		'lib32-libxau' 'lib32-libxdmcp' 'lib32-freetype2'
		'lib32-fontconfig' 'lib32-expat' 'lib32-libpng12'
		'lib32-libstdc++5' 'lib32-ncurses' 'lib32-libcanberra'
		'lib32-libsm' 'lib32-libice' 'lib32-zlib' 'lib32-libxft'
		'lib32-libxt' 'lib32-libxrender'
		'lib32-libxft' 'lib32-util-linux')
	optdepends=('lib32-gtk: For eclipse-nios2 support'
		'lib32-libxtst: For eclipse-nios2 support')
	makedepends=('lib32-fakeroot')
fi
depends+=('tcl')

makedepends+=('bash')
options=('!strip')
source=("http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_installers/QuartusSetup-13.1.0.162.run"
	"http://download.altera.com/akdlm/software/acdsinst/13.1.4/182/update/QuartusSetup-13.1.4.182.run"
	"quartus.sh"
	"quartus.desktop"
	"51-usbblaster.rules")
md5sums=('7fefaa7dba6bc42801d043afccc97ae5'
	'172c8cd0eb631b988516f1182054f976'
	'067c444cae7fe31d3608245712b43ce8'
	'32b17cb8b992fc2dccd33d87f0dcd8ce'
	'f5744dc4820725b93917e3a24df13da9')

package() {
	cd "${srcdir}"

	# Install version 13.1.0.162
	chmod a+x QuartusSetup-13.1.0.162.run
	DISPLAY="" ./QuartusSetup-13.1.0.162.run --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_alteradir}"

	# Update to version to 13.1.4.182
	chmod +x QuartusSetup-13.1.4.182.run
	DISPLAY="" ./QuartusSetup-13.1.4.182.run --mode unattended --unattendedmodeui none --installdir "${pkgdir}${_alteradir}"

	# Remove uninstaller and install logs since we have a working package management
	rm -r "${pkgdir}${_alteradir}/uninstall"
	rm -r "${pkgdir}${_alteradir}/logs"
	
	# Replace altera directory in integration files
	sed -i.bak "s,_alteradir,$_alteradir,g" quartus.sh
	sed -i.bak "s,_alteradir,$_alteradir,g" quartus.desktop

	# Copy license file
	install -D -m644 "${pkgdir}${_alteradir}/quartus/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install integration files
	install -D -m755 quartus.sh "${pkgdir}/etc/profile.d/quartus.sh"
	install -D -m644 51-usbblaster.rules "${pkgdir}/etc/udev/rules.d/51-usbblaster.rules"
	install -D -m644 quartus.desktop "${pkgdir}/usr/share/applications/quartus.desktop"
								
}
