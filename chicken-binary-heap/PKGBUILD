# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-binary-heap
pkgver=1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Binary heap."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/binary-heap"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=binary-heap&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/binary-heap.html")
md5sums=('caddbd92f157f2e880665c8df070edbb' '048d4ff40704fcbdcda730e748f4a030')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "binary-heap-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "binary-heap-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "binary-heap-$pkgver/$fname"
		else
			dd iflag=fullblock of="binary-heap-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/binary-heap-$pkgver"
	cp ../$pkgname-$pkgver.html binary-heap.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/binary-heap"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "binary-heap.html" "$pkgdir/usr/share/doc/$pkgname/binary-heap.html"
}
