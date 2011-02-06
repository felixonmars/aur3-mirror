# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-byte-blob-stream
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Lazy byte blobs"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/byte-blob-stream"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-srfi-41' 'chicken-byte-blob' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=byte-blob-stream&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/byte-blob-stream.html")
md5sums=('91581290ad73fc8e9fe28c4d501bdb96' '16660698d7b2d6182de0734f13961c6c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "byte-blob-stream-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "byte-blob-stream-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "byte-blob-stream-$pkgver/$fname"
		else
			dd iflag=fullblock of="byte-blob-stream-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/byte-blob-stream-$pkgver"
	cp ../$pkgname-$pkgver.html byte-blob-stream.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/byte-blob-stream"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "byte-blob-stream.html" "$pkgdir/usr/share/doc/$pkgname/byte-blob-stream.html"
}
