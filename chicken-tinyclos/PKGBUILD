# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-tinyclos
pkgver=1.8.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Gregor Kiczales TinyCLOS object system"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tinyclos"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=tinyclos&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/tinyclos.html")
md5sums=('e391fdf2afec5c83710385a679095aab' '89e31a1c6dc690ad52ac1befd90d89d5')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "tinyclos-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "tinyclos-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "tinyclos-$pkgver/$fname"
		else
			dd iflag=fullblock of="tinyclos-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/tinyclos-$pkgver"
	cp ../$pkgname-$pkgver.html tinyclos.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/tinyclos"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "tinyclos.html" "$pkgdir/usr/share/doc/$pkgname/tinyclos.html"
}
