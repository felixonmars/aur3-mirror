# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-45
pkgver=3.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Primitives for Expressing Iterative Lazy Algorithms"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-45"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-45&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-45.html")
md5sums=('eb459ef88ff115b6aa353626b071f973' 'e43b042ed77df88cccb7ed1da93552aa')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-45-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-45-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-45-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-45-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-45-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-45.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-45"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-45.html" "$pkgdir/usr/share/doc/$pkgname/srfi-45.html"
}
