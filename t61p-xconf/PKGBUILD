# Maintainer:  Adam Eberlin < ae at adameberlin dot com >

pkgname=t61p-xconf
pkgver=1.0
pkgrel=1
pkgdesc="Lenovo Thinkpad T61p Xorg Config (NVIDIA QUADRO FX 570M)"
arch=('i686' 'x86_64')
conflicts=()
depends=('xorg-server' 'nvidia')
license=('GPL')
makedepends=()
url=http://www.adameberlin.com/
source=('XF86Config')
md5sums=('1fd87ca8eda2b70c7dffcaf7e91f3b93')

build()
{
	install -Dm644 ${srcdir}/XF86Config ${pkgdir}/etc/X11/XF86Config
}
# vim:syntax=sh
