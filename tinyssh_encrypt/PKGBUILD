# Maintainer: notme@mali
# Contributor: Malina Salina, #micca@irc.freenode.net
pkgname=tinyssh_encrypt
_pkgname=tinyssh
pkgver=20150201
pkgrel=1
pkgdesc="Embeds an experimental tinyssh server into initramfs for ssh managegment or unlocking encrypted fs."
url='http://tinyssh.org'
arch=('x86_64' 'i686' 'arm')
license=('Public Domain')
source=('tinyssh_encrypt_hook' 'tinyssh_encrypt_install' "$pkgname.install")
depends=('tinyssh' 'cryptsetup' 'dropbear_initrd_encrypt' 'psmisc' 
'iproute2' 'ucspi-tcp')
optdepends=('openssh: create current ssh keys')
install=$pkgname.install

#build () {
# If one wanted to only have the tinyssh in the initramfs, one could dl source and make according to commented sections.
# However this would leave the tinyssh binaries in the /usr/lib/initcpio anyway, meaning, one might as well have it properly installed.
#	cd "${srcdir}/${pkgname}-${pkgver//./}"
#	make
#}

package() {
	# See note in build
	#cd "${srcdir}/${pkgname}-${pkgver//./}"
	#install -Dm755 build/bin/tinysshd* "${pkgdir}/usr/lib/initcpio/"
	
  install -Dm644 "$srcdir/tinyssh_encrypt_hook" "$pkgdir/usr/lib/initcpio/hooks/tinyssh_encrypt"
  install -Dm644 "$srcdir/tinyssh_encrypt_install" "$pkgdir/usr/lib/initcpio/install/tinyssh_encrypt"
}
md5sums=('f8d2aafaff6f6f206b7d1f794e5bd59f'
         '8353677f5987a452972ba48f1e6585a3'
         '6bf882c5daaa1d04291272d1a2c748f1')
