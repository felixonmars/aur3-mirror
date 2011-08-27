# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-38
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A Chicken version of the SRFI-38 reference implementation"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-38"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-38&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-38.html")
md5sums=('9d9d3ada4839ccdddb8c855a9fc4d6e6' 'b4148b2ae8ca69f9d4eadf6780718b61')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-38-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-38-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-38-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-38-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-38-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-38.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-38"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-38.html" "$pkgdir/usr/share/doc/$pkgname/srfi-38.html"
}
