# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-blob-record
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A facility for representing records as blobs."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/blob-record"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-byte-blob' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=blob-record&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/blob-record.html")
md5sums=('7eafec39557d85f01b8129ba18387e44' '75bb719a1d4ec070e32605e333ef444a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "blob-record-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "blob-record-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "blob-record-$pkgver/$fname"
		else
			dd iflag=fullblock of="blob-record-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/blob-record-$pkgver"
	cp ../$pkgname-$pkgver.html blob-record.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/blob-record"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "blob-record.html" "$pkgdir/usr/share/doc/$pkgname/blob-record.html"
}
