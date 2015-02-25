# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Major contributor: Andreas Radke <andyrtr@archlinux.org>
# Major contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xdg-utils-no-open
pkgver=1.1.0.git20141009
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks (patched to remove xdg-open)"
arch=('any')
url="http://cgit.freedesktop.org/xdg/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('linopen: for xdg-open support'
            'expro: for xdg-open support'
            'busking-git: for xdg-open support'
            'mimi-git: for xdg-open support')
source=(git://anongit.freedesktop.org/xdg/xdg-utils#commit=f0df41402e827051ec16bac212c8eaf08ada75e4)
md5sums=('SKIP')

# Set this 1 to conflict with xdg-utils so you can
# go without xdg-open for whatever reason
PROVIDE_XDG_OPEN=0

if [ $PROVIDE_XDG_OPEN -eq 1 ]; then
   provides=('xdg-utils')
   conflicts=('xdg-utils')
fi

pkgver() {
	cd xdg-utils
	echo "1.1.0.git$(git log -1 --format="%cd" --date=short | sed 's|-||g')"
}

prepare(){
    cd xdg-utils/scripts
    sed -i -e '20 h' -e '20 d' -e '23 c \    xdg-settings\n#    xdg-open' Makefile.in
}

build() {
	cd xdg-utils*
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
