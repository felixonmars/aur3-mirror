# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-input-parse
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: input-stream tokenizing and parsing routines."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/input-parse"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=input-parse&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/input-parse.html")
md5sums=('91fe04b62a1ded1be647d9a30ce88346' '4b1cdd8e90a8e72c08c9ef07ccecd9fe')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "input-parse-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "input-parse-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "input-parse-$pkgver/$fname"
		else
			dd iflag=fullblock of="input-parse-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/input-parse-$pkgver"
	cp ../$pkgname-$pkgver.html input-parse.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/input-parse"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "input-parse.html" "$pkgdir/usr/share/doc/$pkgname/input-parse.html"
}
