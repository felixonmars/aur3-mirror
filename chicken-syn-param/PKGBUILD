# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-syn-param
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Operators with Extended Parameter Syntax"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/syn-param"
license=('unknown')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=syn-param&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/syn-param.html")
md5sums=('ed8c813216390c4585be6b86d6347765' 'e0c5192dca50afff77029849f81256f1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "syn-param-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "syn-param-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "syn-param-$pkgver/$fname"
		else
			dd iflag=fullblock of="syn-param-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/syn-param-$pkgver"
	cp ../$pkgname-$pkgver.html syn-param.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/syn-param"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "syn-param.html" "$pkgdir/usr/share/doc/$pkgname/syn-param.html"
}
