# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
_pkgname=lg4l-gnome15
pkgname=lg4l-gnome15-lts
pkgver=0.14
_extramodules=$(ls -v /usr/lib/modules/ | grep lts | grep extra | tail -n 1)
pkgrel=2
pkgdesc="Drivers for Logitech G devices (Gnome15 branch)"
arch=(i686 x86_64)
url="http://www.russo79.com/gnome15"
license=('GPL')
depends=('linux-lts>=3.14' 'linux-lts<3.15')
makedepends=('linux-lts-headers')
conflicts=('lg4l-git', 'lg4l-gnome15')
provides=('lg4l')
install=lg4l-gnome15-lts.install
source=("https://projects.russo79.com/attachments/download/139/$_pkgname-$pkgver.tar.gz")
md5sums=('ad50739683fbeb5ec76440e6abc8c1b1')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	sed -i "s#uname -r#ls -v /usr/lib/modules/ | grep lts | grep -v extra | tail -n 1#" Makefile
	sed -i "s#/lib/modules/\$(KVERSION)/updates/g-series#/lib/modules/\$(ls -v /usr/lib/modules/ | grep lts | grep extra | tail -n 1)#" Makefile
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -d "${pkgdir}/usr/lib/modules/$_extramodules/"
	install -t "${pkgdir}/usr/lib/modules/$_extramodules/" *.ko

        install -d "${pkgdir}/usr/lib/udev/rules.d/"
        install -t "${pkgdir}/usr/lib/udev/rules.d/" 90-lg4l.rules

        install -d "${pkgdir}/usr/share/doc/${_pkgname}/"
        install -t "${pkgdir}/usr/share/doc/${_pkgname}/" README.md
        install -t "${pkgdir}/usr/share/doc/${_pkgname}/" rebind
}
