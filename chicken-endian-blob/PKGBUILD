# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-endian-blob
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Endian-specific procedures for converting blobs to numeric values and vectors."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/endian-blob"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-byte-blob' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=endian-blob&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/endian-blob.html")
md5sums=('b2acdb965721edc2ac649b32b005636e' '363ca031a3af70405d1354c01e05b93b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "endian-blob-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "endian-blob-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "endian-blob-$pkgver/$fname"
		else
			dd iflag=fullblock of="endian-blob-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/endian-blob-$pkgver"
	cp ../$pkgname-$pkgver.html endian-blob.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/endian-blob"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "endian-blob.html" "$pkgdir/usr/share/doc/$pkgname/endian-blob.html"
}
