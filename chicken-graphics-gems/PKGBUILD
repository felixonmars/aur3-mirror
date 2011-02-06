# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-graphics-gems
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Bézier curve fitting, using algorithm from Graphics Gems"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/graphics-gems"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=graphics-gems&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/graphics-gems.html")
md5sums=('5319963d310cd5b0c08f362de9313bbd' '5e08ed43befe73a3b100e59ae3f25871')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "graphics-gems-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "graphics-gems-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "graphics-gems-$pkgver/$fname"
		else
			dd iflag=fullblock of="graphics-gems-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/graphics-gems-$pkgver"
	cp ../$pkgname-$pkgver.html graphics-gems.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/graphics-gems"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "graphics-gems.html" "$pkgdir/usr/share/doc/$pkgname/graphics-gems.html"
}
