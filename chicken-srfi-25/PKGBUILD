# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-25
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Multidimensional arrays"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-25"
license=('custom:SRFI')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-25&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-25.html")
md5sums=('b978c682e1946cc6a3cabf777a6568bc' '14b5e837cc5fccfb566fd30c2891ccf9')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-25-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-25-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-25-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-25-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-25-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-25.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-25"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-25.html" "$pkgdir/usr/share/doc/$pkgname/srfi-25.html"
}
