# Maintainer: Pascal 'hardfalcon' Ernster <aur@hardfalcon.net>
# Contributor: nofxx <x@nofxx.com>
# Contributor: Isaac Aronson <i@pingas.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
_pkgname=iodine
pkgname=$_pkgname-git
pkgver=664.59dbaf2
pkgrel=1
pkgdesc="Lets you tunnel IPv4 data through a DNS server."
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv7h' 'mips64el')
url="http://code.kryo.se/iodine"
license=('custom: ISC')
depends=('net-tools')
checkdepends=('check')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/conf.d/$_pkgname"
	"etc/conf.d/${_pkgname}d")
install="$_pkgname.install"
source=("$_pkgname.conf"
	"${_pkgname}d.conf"
	"$_pkgname.service"
	"${_pkgname}d.service")
source=("git://github.com/yarrick/${_pkgname}.git"
	"$_pkgname.conf"
	"${_pkgname}d.conf"
	"$_pkgname.service"
	"${_pkgname}d.service")
sha256sums=('SKIP'
	'a19c3c0c807b7e42557cb9ddf5d5f32c05eed9f835f0e52b5bb0d96a368df16b'
	'c1b179b7c7683ad5a1069706bb5f0096132787cb1eb2087a45931f21869e6d42'
	'1dc081e029f3b0cec044bf6d07448dcf79890a434b50404400482f0bab4cb693'
	'1e80d9d3d7f87b10e35d9f14220241ce8d6b00fcb834e40345bebcfd5b850001')

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd $_pkgname
	msg2 "Starting make..."
	make
}

check() {
	cd $_pkgname
	msg2 "Starting make test..."
	make test
}

package() {
	provides=("$_pkgname=$(sed -n '0,/^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}:\s\+\(\S\+\).*$/s//\1/p' $srcdir/$_pkgname/CHANGELOG | tr - _)")
	
	cd $_pkgname
	msg2 "Starting make install..."
	make prefix="/usr" DESTDIR="$pkgdir" install
	
	install -Dm600 "$srcdir/$_pkgname.conf" "$pkgdir/etc/conf.d/$_pkgname"
	install -Dm600 "$srcdir/${_pkgname}d.conf" "$pkgdir/etc/conf.d/${_pkgname}d"
	install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "$srcdir/${_pkgname}d.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}d.service"

	install -d "$pkgdir/usr/share/licenses/$_pkgname"
	sed -n '/AUTHORS & LICENSE/,$p' README > "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"
}
