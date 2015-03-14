# Maintainer: ybznek

pkgname="persistent-ssh"
pkgver=1
pkgrel=2
pkgdesc="Simple wrapper. Use old ssh to create new"
arch=('i686' 'x86_64')
url="http://zbynek.php5.cz"
depends=('openssh')
license=('GPL2')
source=("sshp" ".sshConfig")
 
package() {
	install -m755 -d ${pkgdir}/usr/bin
	cp ./sshp ${pkgdir}/usr/bin/sshp
	chmod 775 ${pkgdir}/usr/bin/sshp
	install -m755 -d ${pkgdir}/usr/share/sshp
	cp ./.sshConfig ${pkgdir}/usr/share/sshp/.sshConfig

}

md5sums=('68083245ca3edc0df18a544f91e32274' 'ca6265f731552dba823dac2807ed9a9a')
