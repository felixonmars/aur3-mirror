# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-pandora
pkgver=1.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: An object-relation mapper using the prometheus object system."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/pandora"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-check-errors' 'chicken-matchable' 'chicken-prometheus' 'chicken-uri-generic' 'chicken-lru-cache' 'chicken-sql-null' 'chicken-sqlite3' 'chicken-postgresql')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=pandora&version=$pkgver"
		)
md5sums=('d2c87b6b342c7641a56a7d8c7d1678cd')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "pandora-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "pandora-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "pandora-$pkgver/$fname"
		else
			dd iflag=fullblock of="pandora-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/pandora-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/pandora"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
