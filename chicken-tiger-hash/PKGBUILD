# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-tiger-hash
pkgver=2.0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Tiger/192 Message Digest"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tiger-hash"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-message-digest' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=tiger-hash&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/tiger-hash.html")
md5sums=('07b118c7b9d13611b46414f559c0288a' '481ca9ce3fdc29c90f6b16ccc91b9c18')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "tiger-hash-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "tiger-hash-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "tiger-hash-$pkgver/$fname"
		else
			dd iflag=fullblock of="tiger-hash-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/tiger-hash-$pkgver"
	cp ../$pkgname-$pkgver.html tiger-hash.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/tiger-hash"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "tiger-hash.html" "$pkgdir/usr/share/doc/$pkgname/tiger-hash.html"
}
