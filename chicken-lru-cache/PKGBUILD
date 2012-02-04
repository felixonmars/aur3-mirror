# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-lru-cache
pkgver=0.5.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: LRU cache"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/lru-cache"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-record-variants' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=lru-cache&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/lru-cache.html")
md5sums=('2fc4b9c48ece7744fd5b50690ab36ec1' 'f13108f2a64e65269f2a51987d74cc6f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "lru-cache-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "lru-cache-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "lru-cache-$pkgver/$fname"
		else
			dd iflag=fullblock of="lru-cache-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/lru-cache-$pkgver"
	cp ../$pkgname-$pkgver.html lru-cache.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/lru-cache"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "lru-cache.html" "$pkgdir/usr/share/doc/$pkgname/lru-cache.html"
}
