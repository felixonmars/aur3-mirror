# Contributor: nofxx <x@nofxx.com>
pkgname=phoss
pkgver=0.1.13
pkgrel=2
pkgdesc="Sniffer designed to find HTTP, FTP, LDAP, Telnet, IMAP4, VNC and POP3 logins."
arch=('i686' 'x86_64')
url="http://phenoelit-us.org"
license=('GPL')
depends=('libpcap')
provides=(phoss)
conflicts=(phoss)
install=
source=(http://phenoelit-us.org/phoss/PHoss_src.tar.gz http://phenoelit-us.org/phoss/PHoss.diff)
md5sums=('0c6d2f47ff9808b288c88ba6881ac286'
         'adff53f3bff2d56f84dc30fae9588095')
	 
	build() {
		cd $startdir/src 
		msg "Patching to read tcpdump files. (Use -r)"
		patch -Np0 < PHoss.diff || return 1
                
		cd $startdir/src/PHoss
		make || return 1
		install -Dm755 PHoss ${startdir}/pkg/usr/sbin/PHoss || return 1	
	}
