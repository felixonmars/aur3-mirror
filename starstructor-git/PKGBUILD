pkgname=starstructor-git
pkgver=80
pkgrel=1
pkgdesc="Starstructor is a graphical .dungeon and .structure (ship) editor"
arch=(any)
url="http://community.playstarbound.com/index.php?resources/starstructor-the-starbound-toolset.152/"
license=("GPLv2")
depends=(json.net)
makedepends=(git mono)
source=("${pkgname%-*}::git+https://github.com/cstamford/Starstructor.git"
"starstructor.png"
"starstructor.desktop"
"starstructor.sh")
md5sums=('SKIP'
         '10202fa6b47e1d79ba1f59e52b8590f7'
         '6a4acb581089c52d2e13a4adb5d36505'
         '19c2c1715031876bc6a02faf851c6296')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

prepare() {
	cd "$srcdir/${pkgname%-*}"
	sed -i 's,log.txt,/tmp/starstructor.log,' Starstructor/Editor.cs
	sed -i 's,string path = AppDomain.CurrentDomain.BaseDirectory + "settings.json",string path = Environment.GetFolderPath(Environment.SpecialFolder.Personal) + "/.starstructor.json",g' Starstructor/Editor.cs
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	xbuild Starstructor.sln /p:Configuration=Release
}

package() {
	cd "${srcdir}/${pkgname%-*}/Starstructor/bin/Release"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/lib/starstructor/"{} \;
	install -Dm755 "$srcdir/starstructor.sh" "$pkgdir/usr/bin/starstructor"
	install -Dm644 "$srcdir/starstructor.png" "$pkgdir/usr/share/icons/starstructor.png"
	install -Dm644 ../../../LICENSE "$pkgdir/usr/share/licenses/starstructor/LICENSE"
	install -Dm644 "$srcdir/starstructor.desktop" "$pkgdir/usr/share/applications/starstructor.desktop"
} 
