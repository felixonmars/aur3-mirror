# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-records
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Procedural record-type interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/records"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=records&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/records.html")
md5sums=('4c819e5d18a9925c1c59b7b98a4c930e' '860f416996941920bc2a0a49228d14ce')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "records-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "records-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "records-$pkgver/$fname"
		else
			dd iflag=fullblock of="records-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/records-$pkgver"
	cp ../$pkgname-$pkgver.html records.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/records"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "records.html" "$pkgdir/usr/share/doc/$pkgname/records.html"
}
