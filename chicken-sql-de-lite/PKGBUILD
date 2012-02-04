# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sql-de-lite
pkgver=0.4.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: SQLite 3 interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sql-de-lite"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-lru-cache>=0.5.3' 'chicken-foreigners' 'sqlite3')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sql-de-lite&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sql-de-lite.html")
md5sums=('b3d5ab7c2e7458408013b23afdd070f8' '962e98a6c9a35800089da92a4d8a1084')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sql-de-lite-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sql-de-lite-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sql-de-lite-$pkgver/$fname"
		else
			dd iflag=fullblock of="sql-de-lite-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sql-de-lite-$pkgver"
	cp ../$pkgname-$pkgver.html sql-de-lite.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sql-de-lite"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sql-de-lite.html" "$pkgdir/usr/share/doc/$pkgname/sql-de-lite.html"
}
