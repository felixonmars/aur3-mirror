# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-pool
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A set of functions to manage pools in a thread-safe manner"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/pool"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=pool&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/pool.html")
md5sums=('c06893caacb71fb4086351e085f0bd88' '3c433115b6ae6e1c639ccd7eaba91ea2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "pool-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "pool-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "pool-$pkgver/$fname"
		else
			dd iflag=fullblock of="pool-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/pool-$pkgver"
	cp ../$pkgname-$pkgver.html pool.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/pool"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "pool.html" "$pkgdir/usr/share/doc/$pkgname/pool.html"
}
