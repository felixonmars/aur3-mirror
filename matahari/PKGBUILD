# Contributor: nofxx <x@nofxx.com>
pkgname=matahari
pkgver=0.1.25
pkgrel=1
pkgdesc="A reverse HTTP shell to execute commands on remote machines behind firewalls."
arch=('i686' 'x86_64')
url="http://matahari.sourceforge.net"
license=('GPL')
depends=('python')
provides=(matahari)
conflicts=(matahari)
install=
source=(http://downloads.sourceforge.net/matahari/$pkgname-v$pkgver.tar.gz)
noextract=()
md5sums=('4bb5515c0172fa0b4db62c85c480526b')

	build() {
	        cd $startdir/src
		install -Dm755 matahari.py ${startdir}/pkg/usr/share/matahari/matahari.py || return 1
		mkdir ${startdir}/pkg/usr/sbin
		ln -s /usr/share/matahari/matahari.py ${startdir}/pkg/usr/sbin/matahari
		msg "matahari.py avaiable on '/usr/share/matahari' and linked on '/usr/sbin/matari'"
	}
