# $Id$
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=xdg-utils-open-generic-fix
pkgver=1.1.0.git20140426
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks (patched to correctly open mailto links)"
arch=('any')
url="http://cgit.freedesktop.org/xdg/xdg-utils/"
license=('MIT')
provides=('xdg-utils')
conflicts=('xdg-utils')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kdebase-runtime: for KDE support in xdg-open'
            'libgnome: for GNOME support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-o	pen'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open')
source=(git://anongit.freedesktop.org/xdg/xdg-utils#commit=869b22b75fc6e7c9e29ba5367bd97ebf7ce76cb3
		'open-generic-fix.patch')
md5sums=('SKIP'
		'1a9b8d858cfc12429e3631d8e4c48a5f')
pkgver() {
	cd xdg-utils
	echo "1.1.0.git$(git log -1 --format="%cd" --date=short | sed 's|-||g')"
}

prepare() {
    cd xdg-utils/scripts
    patch xdg-email.in < ../../open-generic-fix.patch
}

build() {
	cd xdg-utils
	./configure --prefix=/usr --mandir=/usr/share/man
#	make scripts-clean -C scripts # needed if it's a git snapshot
#	make man scripts -C scripts # needed if it's a git snapshot
	make # for release builds
}

package() {
	cd xdg-utils
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	# install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
	install -dm755 $pkgdir/usr/share/desktop-directories
}

