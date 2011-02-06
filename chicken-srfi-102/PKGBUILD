# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-102
pkgver=1.0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Procedure Introspection (From Draft SRFI 102)"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-102"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-102&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-102.html")
md5sums=('3b9fec55a59f79226d088fde54ba1e9d' 'f5638a118f9b43f15a08e1c297863419')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-102-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-102-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-102-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-102-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-102-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-102.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-102"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-102.html" "$pkgdir/usr/share/doc/$pkgname/srfi-102.html"
}
