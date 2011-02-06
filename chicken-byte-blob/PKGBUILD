# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-byte-blob
pkgver=1.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: Byte array utility procedures for blobs."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/byte-blob"
license=('LGPL3')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=byte-blob&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/byte-blob.html")
md5sums=('659379986bf9bc03bc2a58ffa8d1a80e' '5b6751a87d1dcd9d915444ddb7c70379')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "byte-blob-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "byte-blob-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "byte-blob-$pkgver/$fname"
		else
			dd iflag=fullblock of="byte-blob-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/byte-blob-$pkgver"
	cp ../$pkgname-$pkgver.html byte-blob.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/byte-blob"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "byte-blob.html" "$pkgdir/usr/share/doc/$pkgname/byte-blob.html"
}
