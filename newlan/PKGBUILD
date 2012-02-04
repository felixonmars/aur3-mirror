# Contributor: LinkFast Company <opensource@linkfastsa.com>
# Thanks to  : Angel (pilli) (http://aur.archlinux.org/account.php?Action=AccountInfo&ID=1061) for correcting the PKGBUILD

pkgname=newlan
pkgver=1.0.0.8
pkgrel=3
pkgdesc="newlan is an easy to use creator of netcfg profiles."
arch=(i686 x86_64)
url="http://www.aldealinkfast.com/oss/archlinux/newlan"
license="GPL"
depends=('mono' 'netcfg')
#makedepends=()
provides=(${pkgname})
#conflicts=()
#replaces=()
#backup=()
#groups=()
#options=()
#install=
source=(http://download.aldealinkfast.com/archlinux/newlan/$pkgname-$pkgver-bin.tar.xz)
noextract=()
md5sums=('ce052e9b9bc0959db3e1efe3ebafb467')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/bin
	install $startdir/src/newlan $startdir/pkg/usr/bin/newlan
	install $startdir/src/newlan.exe $startdir/pkg/usr/bin/newlan.exe
	chmod +x $startdir/pkg/usr/bin/newlan || return 1
}