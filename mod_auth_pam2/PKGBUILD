# # Contributor: Jason Begley <jayray@digitalgoat.com>
pkgname=mod_auth_pam2
pkgver=1.1.1
pkgrel=2
pkgdesc="A Pluggable Authentication Module (PAM) authentication module for the Apache Http Server"
url="http://pam.sourceforge.net/mod_auth_pam/"
license="GPL"
arch=('i686')
depends=('apache>=2.0' 'pam')
makedepends=()
conflicts=()
replaces=()
backup=('etc/pam.d/httpd')
install=
source=(http://pam.sourceforge.net/mod_auth_pam/dist/mod_auth_pam-2.0-$pkgver.tar.gz)
md5sums=('ab873520ddd2fee7d480dfd53e464e0a')

build() {
     cd $startdir/src/mod_auth_pam
     make || return 1
     install -d $startdir/pkg/usr/lib/apache
     apxs -i -S LIBEXECDIR=$startdir/pkg/usr/lib/apache  mod_auth_pam.la
     apxs -i -S LIBEXECDIR=$startdir/pkg/usr/lib/apache  mod_auth_sys_group.la
     install -D samples/httpd $startdir/pkg/etc/pam.d/httpd
	    }
