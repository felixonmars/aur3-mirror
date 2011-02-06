# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-4-comprehensions
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: SRFI-42 Comprehensions for SRFI-4 Vectors"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-4-comprehensions"
license=('custom:SRFI')
depends=('chicken>=4.5.0' 'chicken-srfi-42' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-4-comprehensions&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-4-comprehensions.html")
md5sums=('911324a233da4bd7288e8dc86f8d78ea' '6e64f89e8b50d9b82d732a9638ce0f14')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-4-comprehensions-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-4-comprehensions-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-4-comprehensions-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-4-comprehensions-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-4-comprehensions-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-4-comprehensions.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-4-comprehensions"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-4-comprehensions.html" "$pkgdir/usr/share/doc/$pkgname/srfi-4-comprehensions.html"
}
