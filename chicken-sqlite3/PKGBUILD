# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sqlite3
pkgver=3.5.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Bindings to version 3.x of the SQLite API"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sqlite3"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-check-errors' 'chicken-synch' 'chicken-miscmacros' 'chicken-matchable' 'chicken-sql-null' 'sqlite3')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sqlite3&version=$pkgver"
		)
md5sums=('7e7d944f888b3a32152dd32bd8e03f08')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sqlite3-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sqlite3-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sqlite3-$pkgver/$fname"
		else
			dd iflag=fullblock of="sqlite3-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sqlite3-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sqlite3"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
