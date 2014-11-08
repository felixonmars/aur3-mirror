# Maintainer: bluerider <mark@markelee.com>
# Contributor: onny <onny@project-insanity.org>
# Contributor: bluerider <mark@markelee.com>

pkgname=openwrt-buildroot
pkgver=14.07
pkgrel=1
pkgdesc="A cross-compilation toolchain and a root filesystem for embedded systems"
arch=('i686' 'x86_64')
url="http://openwrt.org"
license="GPL3"
makedepends=('asciidoc' 'bash' 'bc' 'bzip2' 'fastjar' 'flex' 'util-linux' 'gawk' 'gtk2' 'intltool' 'zlib'
              'cdrkit' 'ncurses' 'openssl' 'patch' 'perl' 'python2' 'rsync' 'ruby' 'sdcc' 'unzip' 'wget'
              'gettext' 'libxslt' 'zlib' 'boost' 'libusb' 'bin86' 'sharutils' 'jdk7-openjdk' 'b43-fwcutter'
              'jikes' 'bcc' 'git')
options=('!strip')
source=("openwrt::git://git.openwrt.org/$pkver/openwrt.git"
        "openwrt-feeds::git://git.openwrt.org/$pkgver/packages.git")
sha256sums=('SKIP'
           'SKIP')

build() {
	cd "${srcdir}/openwrt";
	msg "Updating feeds..."
		./scripts/feeds update -a
		./scripts/feeds install -a
	msg "Configuring..."
		make prereq
		make menuconfig
		make defconfig
	msg "Starting make..."
		make -d V=99 # 2>&1 | tee make_output
} 
package () {
	mkdir -p $pkgdir/opt/$pkgname
	cp -a $srcdir/backfire_$pkgver/docs $pkgdir/opt/$pkgname/
	cp -a $srcdir/backfire_$pkgver/* $pkgdir/opt/$pkgname/
}
