# Maintainer: xi0er <xia0er@gmail.com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=stxxl-svn
pkgbase=stxxl
pkgver=3227
pkgrel=1
pkgdesc="Standard Template Library for Extra Large Data Sets"
url="http://stxxl.sourceforge.net/"
license=('custom')
arch=('i686' 'x86_64')
depends=('boost')
makedepends=()
provides=("stxxl")
options=()
source=(LICENSE_1_0.txt)
_svnmod=stxxl
_svntrunk=http://svn.boost.org/svn/boost/trunk
_svndir="stxxl-trunk"
_svntrunk=https://stxxl.svn.sourceforge.net/svnroot/stxxl/trunk/
build() {
        cd ${srcdir}
        svn co -r ${pkgver} ${_svntrunk} ${_svndir}
 
        cd ${srcdir}/${_svndir}
        sed -i 's/^USE_BOOST.*= no/USE_BOOST        = yes/g' make.settings.gnu

	make config_gnu 
	make library_g++
	make tests_g++

	install -d -m755 "$pkgdir/usr/"
	cp -R "$srcdir/${_svndir}/include" "$pkgdir/usr/"
	rm "$pkgdir/usr/include/.gitignore"
	install -d -m755 "$pkgdir/usr/lib"
	cp "$srcdir/${_svndir}/lib/libstxxl_boost.a" "$pkgdir/usr/lib"
	cp "$srcdir/${_svndir}/lib/libstxxl.symbols" "$pkgdir/usr/lib"
	install -D -m 644 "$srcdir/LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/${pkgbase}/LICENSE.txt"
	cd "$pkgdir/usr/lib"
	ln -s libstxxl_boost.a libstxxl.a
}

md5sums=('e4224ccaecb14d942c71d31bef20d78c')
