pkgname=mathematica5.2
pkgver=5.2
pkgrel=1
pkgdesc="Computer Mathematics Package"
arch=(i686 x86_64)
url="http://reference.wolfram.com/legacy/v5/"
license=(proprietary)
depends=()
options=('!strip')

build() {
	cd "${srcdir}"
	msg "You will need to find the Unix folder in Mathematica 5.2 "
	msg ""
	msg "Looking in $(readlink -f `pwd`/..)"
	if [[ -d "../Unix" ]]; then
		msg "Found Unix Folder, installing..."
		cp -rf "../Unix" .
	else
		error "Unable to find Unix Folder."
		return 1
	fi

	cd "./Unix/Installer/"
#	sed -i 's/InfoFindPath_=`dirname "${InstallerPath}"`/InfoFindPath_=`dirname "${InstallerPath}"`\//g' MathInstaller
	#sh MathInstaller -execdir="${pkgdir}/usr/local/bin/" -targetdir="${pkgdir}/opt/Mathematica5.2/" -auto
}



package() {
    cd "${srcdir}/Unix/Installer/"
    sh MathInstaller -execdir="${pkgdir}/usr/local/bin/" -targetdir="${pkgdir}/opt/Mathematica5.2/" -auto
    #Fix absolute links
    msg "Fixing symbolic symlinks"
    cd "$pkgdir/usr/local/bin"
    rm *
    ln -s /opt/Mathematica5.2/Executables/math
    ln -s /opt/Mathematica5.2/Executables/mathematica
    ln -s /opt/Mathematica5.2/Executables/Mathematica
    ln -s /opt/Mathematica5.2/Executables/mcc
    ln -s /opt/Mathematica5.2/Executables/MathKernel
    msg "Done."
}




#1023    # Find the info files.
#1024    InfoFindPath_=`dirname "${InstallerPath}"`
#1025    InfoFileList_=`find "${InfoFindPath_}" -name "info" -print`
#1026    ProductInfoFileList=`echo "${InfoFileList_}" | sed -e 's/^ //g'`
#1027
