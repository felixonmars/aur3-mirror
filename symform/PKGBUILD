# Contributor: Chionsas <symform-arch@chionsas.lt>

pkgname=symform
pkgdesc="Symform cloud backup and storage service client"
pkgver=3.16.3.0
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.symform.com"
license=('custom: Symform EULA')

options=('emptydirs')

if test "$CARCH" == x86_64; then
	source=('http://download.symform.com/control/current/linux/x64/Symform.rpm')
	md5sums=('11aa87d017c80fcd2b4bc2df17a836f9')
elif test "$CARCH" == i686; then
	source=('http://download.symform.com/control/current/linux/x86/Symform.rpm')
	md5sums=('295624c0fe5ff30a2770ee131847cb56')
fi

source+=('install')
md5sums+=('SKIP')

package() {
	cp -r $srcdir/{opt,usr} $pkgdir
}

pkgver() {
	echo `cat $srcdir/opt/symform/bin/version | tr -d '\r'`
}

build() {

	declare -A install_actions=(
		['pre_install']="tail -n +2 ${srcdir}/opt/symform/scripts/preinst"
		['post_install']="echo /opt/symform/scripts/postinst configure && /opt/symform/scripts/platform/systemd.sh && sleep 3 && /opt/symform/SymformNode.sh configure"
		['pre_upgrade']="echo /opt/symform/scripts/prerm"
		['post_upgrade']="echo /opt/symform/scripts/postrm upgrade && /opt/symform/scripts/postinst configure"
		['pre_remove']="echo /opt/symform/scripts/prerm"
		['post_remove']="tail -n +2 ${srcdir}/opt/symform/scripts/postrm"
	)

	echo "#!/bin/bash" > install
	echo >> install

	echo PURGE=1 >> install
	echo >> install

	for action in "${!install_actions[@]}"
	do
		echo "${action}() {" >> install
		${install_actions[$action]} >> install
		echo "}" >> install
		echo >> install
	done
}

install=install