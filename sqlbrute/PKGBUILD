# Contributor: nofxx <x@nofxx.com>
pkgname=sqlbrute
pkgver=1.0
pkgrel=1
pkgdesc="SQLBrute is a tool for brute forcing data out of databases using blind SQL injection."
arch=('i686' 'x86_64')
url="http://www.justinclarke.com/archives/2006/03/sqlbrute.html"
license=('GPL')
depends=('python')
provides=(sqlbrute)
conflicts=(sqlbrute)
install=
source=(http://www.gdssecurity.com/l/t/$pkgname.py)
noextract=()
md5sums=('075ec1281c84a14e5e3871cb22013c47')

	build() {
	        cd $startdir/src
		install -Dm755 $pkgname.py ${startdir}/pkg/usr/share/${pkgname}/${pkgname}.py || return 1
		mkdir ${startdir}/pkg/usr/bin
		ln -s /usr/share/${pkgname}/${pkgname}.py ${startdir}/pkg/usr/bin/${pkgname}
		msg "SQLBrute avaiable on '/usr/share/sqlbrute' and linked as '/usr/bin/sqlbrute'"
	}
