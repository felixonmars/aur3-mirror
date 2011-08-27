# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-opengl
pkgver=1.18
pkgrel=4
pkgdesc="Chicken Scheme Egg: OpenGL bindings"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/opengl"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-silex' 'chicken-easyffi' 'mesa')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=opengl&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/opengl.html")
md5sums=('7aa363e5fcd14ab2e31075b149d60e5a' '932fb402dde4cc78199d1c8ed4a8d5e8')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "opengl-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "opengl-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "opengl-$pkgver/$fname"
		else
			dd iflag=fullblock of="opengl-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/opengl-$pkgver"
	cp ../$pkgname-$pkgver.html opengl.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/opengl"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "opengl.html" "$pkgdir/usr/share/doc/$pkgname/opengl.html"
}
