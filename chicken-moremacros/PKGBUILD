# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-moremacros
pkgver=1.1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: moremacros"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/moremacros"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros' 'chicken-check-errors' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=moremacros&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/moremacros.html")
md5sums=('50b7c9716b8601c1f19c1fc5b85f993c' '17dc4b47458c0f8b870554c42adb3740')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "moremacros-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "moremacros-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "moremacros-$pkgver/$fname"
		else
			dd iflag=fullblock of="moremacros-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/moremacros-$pkgver"
	cp ../$pkgname-$pkgver.html moremacros.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/moremacros"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "moremacros.html" "$pkgdir/usr/share/doc/$pkgname/moremacros.html"
}
