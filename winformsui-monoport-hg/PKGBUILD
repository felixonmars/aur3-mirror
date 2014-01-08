pkgname=winformsui-monoport-hg
pkgver=5
pkgrel=5
pkgdesc="The docking library for .Net Windows Forms development which mimics Visual Studio .Net."
url="https://bitbucket.org/hindlemail"
arch=(any)
license=("MIT")
depends=(mono)
makedepends=(mercurial)
options=(!makeflags)
source=("hg+https://bitbucket.org/hindlemail/winformsui-monoport"
"WinFormsUI.snk"
"winformsui.docking.pc.in")
md5sums=('SKIP'
         'b9445c254930c4ca5cb78deaf9c95cdb'
         '4d25313c698f42b4507df33fe0331f79')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	echo $(hg identify -n)
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	xbuild WinFormsUI.Docking.sln /p:Configuration=Release
	cd WinFormsUI/bin/Release
	monodis WeifenLuo.WinFormsUI.Docking.dll --output=WeifenLuo.WinFormsUI.Docking.il
	ilasm /dll /key:"$srcdir/WinFormsUI.snk" WeifenLuo.WinFormsUI.Docking.il
}

package() {
	cd "${srcdir}/${pkgname%-*}/WinFormsUI/bin/Release"
	find . -name '*.dll' -o -name '*.mdb' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/winformsui.docking/"{}
	find "$pkgdir" -name '*.dll' -exec gacutil -i {} -root "$pkgdir/usr/lib" \;
	mkdir -p "$pkgdir/usr/share/licenses/winformsui-monoport/"
	cd "$pkgdir/usr/share/licenses/winformsui-monoport/"
	ln -s /usr/lib/winformsui.docking/license.txt .
	install -Dm644 "$srcdir/winformsui.docking.pc.in" "$pkgdir/usr/lib/pkgconfig/winformsui.docking.pc"
	sed -i "s|@VERSION@|$pkgver|" "$pkgdir/usr/lib/pkgconfig/winformsui.docking.pc"
}
