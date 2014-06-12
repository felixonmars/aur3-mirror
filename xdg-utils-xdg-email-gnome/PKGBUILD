# $Id$
# Major contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=xdg-utils-xdg-email-gnome
pkgver=1.1.0.git20140426
pkgrel=2
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks (patched to use open_gnome in xdg-email)"
arch=('any')
url="http://cgit.freedesktop.org/xdg/xdg-utils/"
license=('MIT')
provides=('xdg-utils')
conflicts=('xdg-utils')
depends=('sh' 'xorg-xset' 'libgnome') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kdebase-runtime: for KDE support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open')
source=(git://anongit.freedesktop.org/xdg/xdg-utils#commit=869b22b75fc6e7c9e29ba5367bd97ebf7ce76cb3)
md5sums=('SKIP')

pkgver() {
	cd xdg-utils
	echo "1.1.0.git$(git log -1 --format="%cd" --date=short | sed 's|-||g')"
}

prepare() {
    cd xdg-utils/scripts
    # http://forums.bodhilinux.com/index.php?/topic/3063-solved-chromium-mailto-link-doesnt-open-on-thunderbird-xdg-email/page__view__findpost__p__28319
    # Patch to open mailto links in default email client instead of the web
    # browser
    sed 's/open_generic "${mailto}"/open_gnome "${mailto}"/' -i xdg-email.in
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
