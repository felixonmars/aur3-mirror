# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-binary-parse
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Reading variable number of bits from a sequential input stream"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/binary-parse"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=binary-parse&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/binary-parse.html")
md5sums=('1d3e9ec3588aeaca2381f22348eb8b2b' 'b73d50dbae8632dca9b493d2e4d5ea76')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "binary-parse-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "binary-parse-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "binary-parse-$pkgver/$fname"
		else
			dd iflag=fullblock of="binary-parse-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/binary-parse-$pkgver"
	cp ../$pkgname-$pkgver.html binary-parse.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/binary-parse"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "binary-parse.html" "$pkgdir/usr/share/doc/$pkgname/binary-parse.html"
}
