# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-awful-sql-de-lite
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: sql-de-lite support for awful"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/awful-sql-de-lite"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-awful>=0.10' 'chicken-sql-de-lite' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=awful-sql-de-lite&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/awful-sql-de-lite.html")
md5sums=('778d545be6f9c1346efac67916500032' 'e13ada75406c5312df61fd3acb6e24ec')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "awful-sql-de-lite-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "awful-sql-de-lite-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "awful-sql-de-lite-$pkgver/$fname"
		else
			dd iflag=fullblock of="awful-sql-de-lite-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/awful-sql-de-lite-$pkgver"
	cp ../$pkgname-$pkgver.html awful-sql-de-lite.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/awful-sql-de-lite"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "awful-sql-de-lite.html" "$pkgdir/usr/share/doc/$pkgname/awful-sql-de-lite.html"
}
