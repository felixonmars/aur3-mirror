# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sql-null
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A convenience extension for representing SQL NULL values"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sql-null"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sql-null&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sql-null.html")
md5sums=('d6eb9c59e95abd289cc00db18114938a' 'ef52ac2a33c374543b65a072459a16e1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sql-null-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sql-null-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sql-null-$pkgver/$fname"
		else
			dd iflag=fullblock of="sql-null-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sql-null-$pkgver"
	cp ../$pkgname-$pkgver.html sql-null.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sql-null"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sql-null.html" "$pkgdir/usr/share/doc/$pkgname/sql-null.html"
}
