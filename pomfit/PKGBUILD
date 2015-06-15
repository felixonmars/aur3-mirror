# Maintainer: Madotsuki
pkgname=pomfit
pkgver=20150214
pkgrel=1
pkgdesc="Image and file uploader for pomf sites"
arch=('i686' 'x86_64')
url="https://github.com/Senketsu/pomfit/"
license=('LGPL3')
depends=('scrot' 'curl' 'libkeybinder3' 'libnotify' 'gtk3')
makedepends=('git')
source=(${pkgname}::git+https://github.com/Senketsu/pomfit)
sha256sums=('SKIP')
provides=(${pkgname})
conflicts=(${pkgname})

pkgver()
{
	cd ${pkgname}
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build()
{
	cd ${pkgname}
	./autogen.sh
	make PREFIX=/usr -j`nproc`
}

package()
{
	cd ${pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
