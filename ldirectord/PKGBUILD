# Maintainer: Kerin Millar <kerfrmail@gmail.com>
pkgname=ldirectord
pkgver=20101130
pkgrel=1
pkgdesc="A script to monitor and administer real servers in an LVS cluster of load-balanced virtual servers"
arch=(any)
url="http://horms.net/projects/ldirectord/"
license=('GPL')
depends=('perl-io-socket-inet6' 'perl-libwww' 'perl-mailtools' 'ipvsadm')
optdepends=('logrotate: log rotation support')
source=("http://horms.net/projects/$pkgname/download/$pkgname.${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}.926526c374c6"
        "$pkgname.rc-script"
        "$pkgname.cf"
        "$pkgname.logrotate")
md5sums=('07a12410827193b0d3076268639b7b7e'
         'bb36b4cd6bdd95a996a13ba073b9f803'
         '2502fc4d096083d85e6357086eefedb0'
         'c73663075831f48289e2ff71c6c9f013')

package() {
	# Install the application
 	install -Dm755 "$srcdir/$pkgname.${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}.926526c374c6" "${pkgdir}"/usr/sbin/${pkgname}

	# Adhere to FHS
	sed -i -e 's|/usr/etc/ha\.d|/etc/ha.d|g' "${pkgdir}"/usr/sbin/${pkgname}

	# Disable warnings (see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=649683#10)
	sed -i -e '0,/RE/s/\s\-w//' "${pkgdir}"/usr/sbin/${pkgname}

	# Install the runscript
	install -Dm755 ${pkgname}.rc-script "${pkgdir}"/etc/rc.d/${pkgname}

	# Install the sample configuration file
	install -Dm644 ${pkgname}.cf "${pkgdir}"/etc/ha.d/${pkgname}.cf

	# Generate a manpage
	mkdir -p "${pkgdir}"/usr/share/man/man8
	pod2man "${pkgdir}"/usr/sbin/${pkgname} | gzip -c > "${pkgdir}"/usr/share/man/man8/${pkgname}.8.gz
	chmod 644 "${pkgdir}"/usr/share/man/man8/${pkgname}.8.gz

	# Install logrotate snippet
	install -Dm644 ${pkgname}.logrotate "${pkgdir}"/etc/logrotate.d/$pkgname
}

# vim:set ts=2 sw=2 et:
