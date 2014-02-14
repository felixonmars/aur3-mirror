# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pypy-raspbian-nightly-bin
pkgver=69124.4dd6b84f03d6
pkgrel=1
pkgdesc="A Python implementation written in Python, JIT enabled. Latest raspbian binary nightly version. :2.7."
arch=('armv6h')
url="http://buildbot.pypy.org/nightly/trunk/"
license=('MIT')
depends=("libffi" "libtinfo")
source=('http://buildbot.pypy.org/nightly/trunk/pypy-c-jit-latest-linux-armhf-raspbian.tar.bz2'
	"pypy.sh")
options=("!strip") # no need, just takes long
md5sums=("SKIP"
	"18528f7b5baa226f585bcf9c2f1cd208") # changes every night #generate with 'makepkg -g'

#prepare() {
#	#newest directory in case there are more
#	D="$(ls -d -t "$srcdir/"pypy-c-jit-*-linux-armhf-raspbian | head -1)"
#	cd "$D"
#}

#build() {
#	cd "$srcdir/$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$srcdir/$pkgname-$pkgver"
#	make -k check
#}

package() {
	D="$(ls -d -t "$srcdir/"pypy-c-jit-*-linux-armhf-raspbian | head -1)"
	cd "$D"

	install -d "$pkgdir/opt/pypy/compatlibs"
	ln -s /usr/lib/libffi.so.6 "$pkgdir/opt/pypy/compatlibs/libffi.so.5"
	cp -ra * "$pkgdir/opt/pypy/"

	install -d "$pkgdir/usr/bin"
	install -m755 "$srcdir/pypy.sh" "$pkgdir/usr/bin/pypy"
}

pkgver() {
	# hacky but whatever
	D="$(ls -d -t pypy-c-jit-*-linux-armhf-raspbian | head -1)"
	echo "$D" | cut -f 4-5 -d "-" | sed "s/-/./g"
}
