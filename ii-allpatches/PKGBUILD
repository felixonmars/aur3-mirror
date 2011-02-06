# Contributer: Hunterm       <hunterm.haxxr@gmail.com>
# Contributor: Evan Gates    <evan.gates@gmail.com>
# Contributor: Dag  Odenhall <dag.odenhall@gmail.com>
# Contributor: Chris Brannon <cmbrannon@cox.net>
pkgname=ii-allpatches
pkgver=1.4
pkgrel=4
pkgdesc="A minimalist FIFO and filesystem-based IRC client"
license=(MIT)
arch=(i686 x86_64)
url=http://tools.suckless.org/ii
depends=(glibc)
conflicts=(ii)
source=("http://dl.suckless.org/tools/ii-${pkgver}.tar.gz"
        "http://tools.suckless.org/ii/patches/ii-1.4-usernames.diff"
        "http://tools.suckless.org/ii/patches/ii-1.4-ctcp_action.diff"
        "http://tools.suckless.org/ii/patches/ii-1.4-autojoin.diff"
        "http://tools.suckless.org/ii/patches/ii-1.4-exec.diff"
        "http://tools.suckless.org/ii/patches/ii-1.4-joinuser.diff"
        "http://tools.suckless.org/ii/patches/ii-1.4-ssl.diff")
md5sums=('535d88c23e84d510edf773db12728ac0'
         '88ba4fd29701b4f83c352f30793bb1bb'
         '1d9952853b20975ef36fedfeff3afb02'
         'ae7f24487d3a2ab3f5047b0dfab8a864'
         'a753ee42d6a089cc79b6c171c7a29ad0'
         '8923535e3435d57c64e66a542afd6172'
         '46445478f15e3f9878e92eea5b1ee7ed')

build() {
    cd ii-$pkgver
    msg "Cleaning..."
    make clean
    msg "Applying patches..."
    msg "Patching in usernames patch..."
	patch -p1 < "../ii-1.4-usernames.diff"
	msg "Patching in action patch..."
	patch -p1 < "../ii-1.4-ctcp_action.diff"
	msg "Patching in autojoin patch..."
	patch -p1 < "../ii-1.4-autojoin.diff"
	msg "Patching in exec patch..."
	patch -p1 < "../ii-1.4-exec.diff"
    msg "Patching in ssl patch..."
    patch -p1 < "../ii-1.4-ssl.diff"
	sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk

	msg "Making..."
	make
	make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install

	chmod 755 "$pkgdir/usr/bin/ii"
    install -m644 -D LICENSE "./pkg/usr/share/licenses/$pkgname/COPYING"
}

