# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/
# Patches welcome: http://github.com/harvie/archlinux-packages

pkgname=openssh-dnssec
pkgver=0.2
pkgrel=1
pkgdesc="DNSSEC wrapper for OpenSSH client which will simply prevent you from connecting to hosts with fraudent DNS records"
arch=('any')
license=('GPL')
url="http://github.com/Harvie/Programs/tree/master/bash/ssh-dnssec/"
depends=('openssh' 'ldns' 'dnssec-root-zone-trust-anchors' 'bash')
#actually will work without dnssec-root-zone-trust-anchors but being less secure
source=('ssh-dnssec.sh')
md5sums=('7ee88323823c448162ef79c514509f0d')

build() {
	mkdir -p ${pkgdir}/usr/bin
	cp -f ${srcdir}/ssh-dnssec.sh ${pkgdir}/usr/bin/ssh-dnssec
	chmod -R 755 ${pkgdir}/
}
