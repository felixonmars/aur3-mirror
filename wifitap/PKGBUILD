# Contributor: nofxx <x@nofxx.com>
pkgname=wifitap
pkgver=0.4.0
pkgrel=1
pkgdesc="Wifitap is a proof of concept for communication over WiFi networks using traffic injection."
arch=('i686' 'x86_64')
url="http://sid.rstack.org/index.php/Wifitap_EN"
license=('GPL')
depends=('python' 'scapy' 'psyco')
provides=(wifitap)
conflicts=(wifitap)
install=
source=(http://sid.rstack.org/code/wifitap/$pkgname-$pkgver.tgz)
md5sums=('6b5a0ac62b308e48b7cfb9e249b231d9')

	build() {
	        cd $startdir/src/$pkgname
		install -d $startdir/pkg/usr/bin
		for executable in *.py; do
			install -Dm755 ${executable} ${startdir}/pkg/usr/share/${pkgname}/${executable} || return 1
		done
		for doc in AUTHORS COPYING PATCHING TODO prismheaders.patch BUGS Changelog README VERSION; do
			install -Dm644 ${doc} ${startdir}/pkg/usr/share/${pkgname}/${doc} || return 1
		done
		ln -s /usr/share/${pkgname}/${pkgname}.py ${startdir}/pkg/usr/bin/${pkgname}
		msg "Wifitap avaiable on '/usr/share/wifitap' and linked on '/usr/bin'"
		msg "For PDF/Postcript support, install 'python-pyx' (~50Mb)."
		msg "For gnuplot interface support, install 'gnuplot-py' from AUR."
	}
