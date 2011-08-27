# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-matrix-utils
pkgver=1.11
pkgrel=4
pkgdesc="Chicken Scheme Egg: Generation of special utility matrices."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/matrix-utils"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-srfi-42' 'chicken-srfi-4-comprehensions' 'chicken-blas' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=matrix-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/matrix-utils.html")
md5sums=('b480ec8fed59b3e31bfbfa65fc35d861' '4932645d9bd80ebfd113d4f592dd0ada')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "matrix-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "matrix-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "matrix-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="matrix-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/matrix-utils-$pkgver"
	cp ../$pkgname-$pkgver.html matrix-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/matrix-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "matrix-utils.html" "$pkgdir/usr/share/doc/$pkgname/matrix-utils.html"
}
