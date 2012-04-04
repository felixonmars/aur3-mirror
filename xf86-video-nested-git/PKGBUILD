#Maintainer: Matt Monaco <net 0x01b dgbaley27>

pkgname=xf86-video-nested-git
pkgver=20120403
pkgrel=1
pkgdesc="Driver to run Xorg on top of Xorg or something else."
url="http://cgit.freedesktop.org/xorg/driver/xf86-video-nested"
license=("MIT")
source=()
md5sums=()
groups=("xorg-drivers")
arch=("x86_64" "i686")
backup=()
depends=("libxext")
makedepends=("xorg-server-devel")
options=("!libtool")

_gitroot="http://cgit.freedesktop.org/xorg/driver/xf86-video-nested"
_gitname="$pkgname"

build()
{
	cd "$srcdir"

	if [[ ! -d "$_gitname" ]]; then
		git clone "$_gitroot" "$_gitname"
		cd "$_gitname"
	else
		cd "$_gitname"
		git pull
	fi

	git clean -xdf

	./autogen.sh --disable-maintainer-mode --prefix=/usr --sysconfdir=/etc
	make
}

package()
{
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}

# vim: set noet :
