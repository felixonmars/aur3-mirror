# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-npdiff
pkgver=1.11
pkgrel=4
pkgdesc="Chicken Scheme Egg: Compute the longest common subsequence of two sequences"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/npdiff"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=npdiff&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/npdiff.html")
md5sums=('b064357933e3003f9ee22565b3d117d0' '670e752136cd1fb42ce7ce6ae8eaf544')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "npdiff-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "npdiff-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "npdiff-$pkgver/$fname"
		else
			dd iflag=fullblock of="npdiff-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/npdiff-$pkgver"
	cp ../$pkgname-$pkgver.html npdiff.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/npdiff"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "npdiff.html" "$pkgdir/usr/share/doc/$pkgname/npdiff.html"
}
