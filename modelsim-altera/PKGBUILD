# Maintainer: Stephen Zhang <zsrkmyn@gmail.com>

########################### NOTICE !!! ###########################
# This PKGBUILD will install ModelSim Altera Edition by default. #
# If you want to install ModelSim Altera Starter Edtion, just    #
# comment the line 19 and uncomment the line 20.                 #
##################################################################

pkgname=modelsim-altera
pkgver=13.1.0.162
pkgrel=1
pkgdesc="Simulation software for Altera FPGA's"

arch=('x86_64' 'i686')
url="http://www.altera.com"
license=('custom')
install=modelsim.install

_alteradir="/opt/altera"
_modelsim_edition="modelsim_ae"
#_modelsim_edition="modelsim_ase"

# According to the installer script, these dependencies are needed for the installer
if [[ ${CARCH} = i686 ]]
then
	depends=('glibc' 'libxext' 'libx11' 'libxau' 'libutil-linux'
		'libxdmcp' 'freetype2' 'fontconfig' 'expat' 'libpng12' 
		'libstdc++5' 'ncurses' 'libcanberra' 'libsm' 'libice'
		'zlib' 'libxft' 'libxt' 'libxrender' 'libxft')
	makedepends=('fakeroot')
fi

if [[ ${CARCH} = x86_64 ]]
then
	depends=('lib32-glibc' 'lib32-libxext' 'lib32-libx11' 
		'lib32-libxau' 'lib32-libxdmcp' 'lib32-freetype2'
		'lib32-fontconfig' 'lib32-expat' 'lib32-libpng12'
		'lib32-libstdc++5' 'lib32-ncurses' 'lib32-libcanberra'
		'lib32-libsm' 'lib32-libice' 'lib32-zlib' 'lib32-libxft'
		'lib32-libxt' 'lib32-libxrender'
		'lib32-libxft' 'lib32-util-linux')
	makedepends=('lib32-fakeroot')
fi
depends+=('tcl' 'quartus-subscription')

makedepends+=('bash')
options=('!strip')
source=("http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_installers/ModelSimSetup-${pkgver}.run"
	"http://seblu.net/a/arm/2013/10/11/multilib/os/x86_64/lib32-freetype2-2.5.0.1-1-x86_64.pkg.tar.xz"
	"modelsim.desktop"
	"modelsim.sh")
md5sums=('45fea341405603f5cf5cd1249bf90976'
         'd3b3b7cdf874b6dd0b60c40d84dd9128'
	 'a5e84ac538cc1276d65c80d26c374a54'
	 '47a88a386903af963f890cb1f7e094ed')

package() {
	# Install old freetype library for ModelSim
	cd ${srcdir}/usr/lib32
	install -d ${pkgdir}/${_alteradir}/${_modelsim_edition}/lib32
	install -Dm755 libfreetype.so.6.10.2 ${pkgdir}/${_alteradir}/${_modelsim_edition}/lib32
	cp -P libfreetype.so{,.6} ${pkgdir}/${_alteradir}/${_modelsim_edition}/lib32

	cd "${srcdir}"

	# Install ModelSim
	chmod a+x ModelSimSetup-${pkgver}.run
	DISPLAY="" ./ModelSimSetup-${pkgver}.run --unattendedmodeui none --mode unattended --installdir  "${pkgdir}${_alteradir}" --modelsim_edition ${_modelsim_edition}

	# Remove uninstaller and install logs since we have a working package management
	rm -r "${pkgdir}${_alteradir}/uninstall"
	rm -r "${pkgdir}${_alteradir}/logs"

	# Replace altera directory in integration files
	sed -i "s,_alteradir,${_alteradir}/${_modelsim_edition},g" modelsim.sh
	sed -i "s,_alteradir,${_alteradir}/${_modelsim_edition},g" modelsim.desktop

	# Patch
	sed -i "205s#_rh60##" ${pkgdir}/${_alteradir}/${_modelsim_edition}/vco
	sed -i "13aexport LD_LIBRARY_PATH=${_alteradir}/${_modelsim_edition}/lib32/" ${pkgdir}/${_alteradir}/${_modelsim_edition}/vco

	# Install integration files
	install -D -m644 modelsim.desktop "${pkgdir}/usr/share/applications/modelsim.desktop"
	install -D -m755 modelsim.sh "${pkgdir}/etc/profile.d/modelsim.sh"
}
