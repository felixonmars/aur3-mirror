# Contributor: Szasz Marton <pcmarci[at]gmail[dot]com>
pkgname=lxp-icewm
pkgver=1.2.30
lxp_ver=0.2
lxp_rel=1
pkgrel=1
pkgdesc="A Window Manager designed for speed, usability, and consistency, LXP patched"
arch=('i686' 'x86_64')
url="http://lxp.sourceforge.net/"
license=('GPLv2')
groups=('lxp')
depends=('libxpm' 'imlib2')
makedepends=('gcc' 'make')
optdepends=('libxft' 'sgmltools-lite')
source=("http://switch.dl.sourceforge.net/project/lxp/lxp-sources/$lxp_ver-$lxp_rel/$pkgname-$pkgver.tar.gz")
md5sums=('79901b4666aab72769787ce4e4fdd8f0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-lookxp --enable-menu-leftpixmap --enable-taskbutton-over 
	sed -ri 's/deprecated __attribute__/ICEWM_deprecated __attribute__/g' src/base.h #https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=661238
	sed -i '/^CORE_LIBS/aCORE_LIBS += -lfontconfig' src/Makefile #http://permalink.gmane.org/gmane.linux.distributions.crux.general/5081
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

