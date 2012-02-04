# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-34
pkgver=0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: SRFI-34: Exception Handling for Programs"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-34"
license=('custom:SRFI')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-34&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-34.html")
md5sums=('998978d56357c6ce58b9e9caeb6984c7' '04dada31a63cb0949bedb2b8fe4c150f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-34-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-34-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-34-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-34-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-34-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-34.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-34"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-34.html" "$pkgdir/usr/share/doc/$pkgname/srfi-34.html"
}
