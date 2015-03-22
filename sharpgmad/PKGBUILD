pkgname=sharpgmad
pkgver=1.2
pkgrel=2
pkgdesc="SharpGMad is a tool used to manipulate Garry's Mod workshop addon packages (.gma files)."
arch=(any)
license=("BSD")
depends=(mono)
url="https://github.com/whisperity/SharpGMad"
source=("https://github.com/whisperity/SharpGMad/archive/v$pkgver.tar.gz"
"sharpgmad."{sh,desktop,png})
md5sums=('bf65ca85522a88bde04d10330b1d21d4'
         '7a46d7c2eea2591c087676f939181d6f'
         'f1474df43139e204df4848a08c39d75b'
         'ee90238aa0790f65d5f3a110db1579ec')

prepare() {
	cd "$srcdir/SharpGMad-$pkgver/SharpGMad"
	sed -i "s,resources,Resources,g" Properties/Resources.resx
	sed -i -e "s,AddAs.designer.cs,AddAs.Designer.cs," \
		-e "s,<PostBuildEvent>,<!-- ," \
		-e "s,</PostBuildEvent>, -->," \
		SharpGMad.csproj
}

build() {
  cd "$srcdir/SharpGMad-$pkgver"
  xbuild SharpGMad.sln
}

package() {
  cd "$srcdir"
  install -Dm755 sharpgmad.sh "$pkgdir/usr/bin/sharpgmad"
  install -Dm644 sharpgmad.desktop "$pkgdir/usr/share/applications/sharpgmad.desktop"
  cd SharpGMad-$pkgver
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/sharpgmad/LICENSE.md"
  install -Dm644 "$srcdir/sharpgmad.png" "$pkgdir/usr/share/icons/sharpgmad.png"
  cd SharpGMad/bin/Debug
  find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/sharpgmad/"{} \;
}
