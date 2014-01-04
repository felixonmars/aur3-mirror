# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=unegg
pkgver=0.5
pkgrel=1
pkgdesc="Uncompress EGG and ALZ files from ALZip"
arch=('x86_64' 'i686')
url="http://www.altools.com/ALTools/ALZip/Egg-format.aspx"
license=('custom')
source=("http://sdn.altools.co.kr/etc/unegg.tar.bz"
        "01-fix_gcc4.7_build.patch")
sha256sums=('812f4e68f3739faff17b1c3a99a961e19fa11bc404575048de46e362f9293aee'
            '649e4c3fb0e9ac41afb53b60352155ded3127c00612ecff3732cd74bace36563')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "$srcdir/01-fix_gcc4.7_build.patch"
}

build() {
	cd "$srcdir/$pkgname/release-x64"
	make
}

package() {
	cd "$srcdir/$pkgname/release-x64"
	install -Dm755 unegg "$pkgdir/usr/bin/unegg"
	cd "$srcdir/$pkgname/doc"
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/unegg/LICENCE"
}
