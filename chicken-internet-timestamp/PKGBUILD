# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-internet-timestamp
pkgver=2.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parser combinators for internet timestamps (RFC 3339)."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/internet-timestamp"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-abnf>=3.0' 'chicken-typeclass' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=internet-timestamp&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/internet-timestamp.html")
md5sums=('6024252bfb8f36dede4670ebedf26c26' '5e677548e771dcdc0f12c01a20a73562')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "internet-timestamp-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "internet-timestamp-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "internet-timestamp-$pkgver/$fname"
		else
			dd iflag=fullblock of="internet-timestamp-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/internet-timestamp-$pkgver"
	cp ../$pkgname-$pkgver.html internet-timestamp.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/internet-timestamp"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "internet-timestamp.html" "$pkgdir/usr/share/doc/$pkgname/internet-timestamp.html"
}
