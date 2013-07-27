#Contributor: Sven Kauber <celeon@gmail.com>
#Contributor: Sigitas Mazaliauskas <sigisnn@gmail.com>
#Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=mod_evasive
pkgver=1.10.1
pkgrel=6
pkgdesc="mod_evasive is an evasive maneuvers module for Apache to provide evasive action in the event of an HTTP DoS or DDoS attack or brute force attack"
arch=('i686' 'x86_64')
url="http://www.zdziarski.com/blog/?page_id=442"
license=('GPL')
depends=('apache' 'glibc')
install="$pkgname.install"
source=("http://www.zdziarski.com/blog/wp-content/uploads/2010/02/${pkgname}_${pkgver}.tar.gz")
md5sums=('784fca4a124f25ccff5b48c7a69a65e5')

build() {

	cd "${srcdir}" || return 1 
	cd ${pkgname} || return 1

	#setting up correct mailing option for Arch
	sed -i 's|^.*#define[ ]MAILER.*$|#define MAILER "/usr/bin/sendmail -t -i %s"|' mod_evasive20.c

	#makes the module
	#apxs -c -o mod_evasive20.so mod_evasive20.c &> /dev/null
	#cp .libs/mod_evasive20.so ${startdir}/pkg/usr/lib/httpd/modules
	mkdir -p "${pkgdir}/usr/lib/httpd/modules/" || return 1
	apxs -i -S LIBEXECDIR="${pkgdir}/usr/lib/httpd/modules/" -o mod_evasive20.so -c mod_evasive20.c || return 1

	#create lock dir
	mkdir -p ${pkgdir}/var/lock/mod_evasive
	chown -R http.http ${pkgdir}/var/lock/mod_evasive

}
