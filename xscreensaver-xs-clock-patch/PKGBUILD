# Maintainer: Tanguy ALEXIS <alexis.tanguy AT yahoo DOT fr>

pkgname=xscreensaver-xs-clock-patch
_original_pkgname=xscreensaver
pkgver=5.19
pkgrel=1
pkgdesc="A simple analog clock screensaver and locker for the X Window System."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libxxf86vm' 'libglade' 'mesa' 'pam' 'xorg-appres' 'libxmu' 'perl-libwww' 'perl-http-message')
makedepends=('bc' 'libxpm')
conflicts=('xscreensaver')
provides=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${_original_pkgname}-${pkgver}.tar.gz
xs-clock-patch-1.0.0-for-xscreensaver-5.15.diff
xscreensaver.pam
LICENSE)
md5sums=('db001e7d17b68fef22f66beb68beb114'
         'c511d9b82d43b9e56bd15d13856eef57'
         '367a3538f54db71f108b34cfa31088ac'
         '5e7f3f2a63d20a484742f5b4cb5d572c')

build() {
	cd "${srcdir}/${_original_pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/xs-clock-patch-1.0.0-for-xscreensaver-5.15.diff"
	sed -i 's/lament.xpm/lament512.xpm/' hacks/glx/Makefile.in
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults --with-pam --with-login-manager --with-gtk --with-gl --without-gle --with-pixbuf --with-jpeg
	make ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/${_original_pkgname}-${pkgver}"
	make install_prefix="${pkgdir}" install
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${_original_pkgname}/LICENSE"
	install -D -m644 ../xscreensaver.pam "${pkgdir}/etc/pam.d/xscreensaver"
	chmod 755 "${pkgdir}/usr/bin/xscreensaver"
	echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}