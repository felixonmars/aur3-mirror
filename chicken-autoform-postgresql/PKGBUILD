# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-autoform-postgresql
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Postgresql support for autoform"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/autoform-postgresql"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-autoform' 'chicken-postgresql' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=autoform-postgresql&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/autoform-postgresql.html")
md5sums=('2838a8cb2e6b6dd1bd86bca748008876' '737784224f423c387e8b1cbe98b08c6d')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "autoform-postgresql-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "autoform-postgresql-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "autoform-postgresql-$pkgver/$fname"
		else
			dd iflag=fullblock of="autoform-postgresql-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/autoform-postgresql-$pkgver"
	cp ../$pkgname-$pkgver.html autoform-postgresql.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/autoform-postgresql"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "autoform-postgresql.html" "$pkgdir/usr/share/doc/$pkgname/autoform-postgresql.html"
}
