# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-ansi-escape-sequences
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Procedures to generate ANSI escape sequences"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ansi-escape-sequences"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=ansi-escape-sequences&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/ansi-escape-sequences.html")
md5sums=('7b7bc3c898f727581a2e509d43982dc2' '1dc64400f3f35a7207402f912b6f2826')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "ansi-escape-sequences-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "ansi-escape-sequences-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "ansi-escape-sequences-$pkgver/$fname"
		else
			dd iflag=fullblock of="ansi-escape-sequences-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/ansi-escape-sequences-$pkgver"
	cp ../$pkgname-$pkgver.html ansi-escape-sequences.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/ansi-escape-sequences"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "ansi-escape-sequences.html" "$pkgdir/usr/share/doc/$pkgname/ansi-escape-sequences.html"
}
