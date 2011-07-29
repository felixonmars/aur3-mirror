# Contributor: irgaly <irgaly@fird.net>

pkgname=adobe-air-sdk-beta
pkgver=2.0beta2
pkgrel=1
pkgdesc="Adobe Air Software Development Kit and Runtime Environment"
conflicts="adobe-air-sdk"
arch=('i686' 'x86_64')
url="http://labs.adobe.com/downloads/air2.html"
license=('custom')
source=('http://download.macromedia.com/pub/labs/air/2/b2/air2_b2_sdk_lin_020210.tbz2')
md5sums=('445a2a84348d3794f4302f1448495d39')
install=${pkgname}.install

build (){
	install -d ${pkgdir}/opt/adobe-air-sdk || return 1
	pushd ${srcdir} || return 1
		find . ! -name air2_b2_sdk_lin_020210.tbz2 ! -name SDK\ license.pdf | sed -e 's/\.\///g' | while read file; do
			if [ -d "$file" ]; then
				install -d ${pkgdir}/opt/adobe-air-sdk/"$file" || return 1
			elif [ -h "$file" ]; then
				if [ $(file "$file" | grep 'broken' -c) = "0" ]; then
					ln -s $(echo $(file "$file" | grep -o -e \`[^\']*) | sed -e "s/\`//g") ${pkgdir}/opt/adobe-air-sdk/"$file" || return 1
				fi || return 1
			else
				install -D "$file" ${pkgdir}/opt/adobe-air-sdk/"$file" || return 1
			fi || return 1
		done || return 1
		install -d ${pkgdir}/usr/share/licences/adobe-air-sdk || return 1
		install -D -m644 ${srcdir}/SDK\ license.pdf ${pkgdir}/usr/share/licences/adobe-air-sdk/sdk-license.pdf || return 1
	popd || return 1
}
