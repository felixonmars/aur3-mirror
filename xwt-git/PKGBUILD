pkgname=xwt-git
pkgver=1893
pkgrel=1
pkgdesc="Xwt is a new .NET framework for creating desktop applications that run on multiple platforms from the same codebase."
arch=(any)
license=("BSD")
depends=(gtk-sharp-2)
makedepends=(mono git)
url="https://github.com/mono/xwt"
source=("${pkgname%-*}::git+https://github.com/mono/xwt.git"
"xwt.pc.in")
md5sums=('SKIP'
         'a1a2c584657c27a18648b4c407716995')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

prepare() {
	cd "$srcdir/${pkgname%-*}"
	find . -name '*.csproj' -exec sed -i "s,<DebugType>none,<DebugType>pdbonly,g" {} \;
}

build() {
	cd "${srcdir}/${pkgname%-*}/Xwt"
	xbuild Xwt.csproj /p:Configuration=Release
	cd ../Xwt.Gtk
	xbuild Xwt.Gtk.csproj /p:Configuration=Release
	cd ../TestApps/Samples
	xbuild Samples.csproj /p:Configuration=Release
	cd ../GtkTest
	xbuild GtkTest.csproj /p:Configuration=Release
}

package() {
	cd "${srcdir}/${pkgname%-*}/TestApps/GtkTest/bin/Release"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/xwt/"{} \;
	find "$pkgdir/usr/lib/xwt" -name 'Xwt*.dll' -exec gacutil -i {} -root "$pkgdir/usr/lib" \;
	install -Dm644 "$srcdir/xwt.pc.in" "$pkgdir/usr/lib/pkgconfig/xwt.pc"
}
