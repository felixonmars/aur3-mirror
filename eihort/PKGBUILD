pkgname=eihort
pkgver=0.3.13
pkgrel=2
pkgdesc='A OpenGL world renderer for minecraft with a really long view distance'
license=('BSD')
url="http://www.minecraftforum.net/topic/438878-/"
arch=('i686' 'x86_64')
depends=('lua' 'glew' 'sdl_image' 'zlib')
makedepends=('python')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/lloigor/$pkgname/get/$pkgver.tar.gz"
        'icon.tar.gz' "$pkgname.desktop" 'intptr_t.patch')
sha1sums=('e2882d2be2b6ca691ed7d930e2451e838987d32b'
          'ba8443da8ff9ff45f3a29069726afb440aaabf1a'
          '5fd5dd65b7c2cbc728d384e482163d3a8bf25a80'
          'e73aa57648abcfc3cf984a45f9e31d0f5f0b182c')

prepare() {
	cd "$srcdir"
	
	#the directory inside the tar archive has a silly name so let’s move it to somewhere else
	dir="$(tar tf "$pkgname-$pkgver.tar.gz" | head -n 1 | sed "s|/.*||")"
	msg2 "$(mv -v "$dir" "$pkgname-$pkgver")"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	patch -p 1 -i ../intptr_t.patch
	
	make "$pkgname-$pkgver-linux-$CARCH"
}

package() {
	cd "$pkgdir"
	
	install -D "$srcdir/$pkgname-$pkgver/$pkgname-$pkgver-linux-$CARCH" "usr/share/games/$pkgname/$pkgname"
	install -m644 $(find "$srcdir/$pkgname-$pkgver/deploy/" \( ! -name "*.dll" \) -type f) "usr/share/games/$pkgname/"
	
	for f in "$srcdir/icon/"*.png; do
		s="$(basename $f .png)"
		install -Dm644 "$f" "usr/share/icons/hicolor/${s}x${s}/apps/$pkgname.png"
	done
	
	install -D "$srcdir/$pkgname-$pkgver/debian/$pkgname" "usr/bin/$pkgname"
	install -D "$srcdir/$pkgname.desktop" "usr/share/applications/$pkgname.desktop"
}