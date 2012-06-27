# Maintainer: Gasper <gasper@opensarm.si>

pkgname=opensarm
pkgver=1.0
pkgrel=10
pkgdesc="Development environment for OpenSARM board."
arch=('any')
url="http://www.opensarm.si"
license=('GPL')
depends=('codeblocks')
conflicts=('arm-elf-gcc' 'arm-elf-binutils')
options=('!strip')
install=opensarm.install
source=("wizard.tar.gz" "http://www.gnuarm.com/bu-2.15_gcc-3.4.3-c-c++-java_nl-1.12.0_gi-6.1.tar.bz2" "lpc21iap")
noextract=("wizard.tar.gz" "bu-2.15_gcc-3.4.3-c-c++-java_nl-1.12.0_gi-6.1.tar.bz2")
md6sums=( "94cd972af36ed8d828b77be24c95f5b8" "2c20a73c738f81a3fd7c377484a4055e" "66e77519ba0f75331ce83bd8cd4a5ec5" )

package() {

	cd "${srcdir}/"

	# Privzete nastavitve
	CB_DIR="${pkgdir}/usr/"
	WIZARD_FILE="wizard.tar.gz"

	# GNU ARM toolchain
	GNUARM_EXTRACT="${pkgdir}/opt/"
	GNUARM_FOLDER="gnuarm-3.4.3/"
	GNUARM_FILE="bu-2.15_gcc-3.4.3-c-c++-java_nl-1.12.0_gi-6.1.tar.bz2"

	CB_DOTSHARE="$CB_DIR/share/codeblocks/";
	CB_WIZARDS="$CB_DIR/share/codeblocks/templates/wizard/"

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p $GNUARM_EXTRACT
	mkdir -p $CB_DOTSHARE
	mkdir -p $CB_WIZARDS
	
	echo "  -> Extracting GNU arm..."
	
	tar -xjf $GNUARM_FILE -C $GNUARM_EXTRACT

	if [[ ! -d $CB_WIZARDS ]] ; then
		mkdir -p $CB_WIZARDS;
	fi

	tar -xzf $WIZARD_FILE -C $CB_DOTSHARE --overwrite

	# Skopiramo programator in mu damo pravice
	cp lpc21iap "${pkgdir}/usr/bin"
}
