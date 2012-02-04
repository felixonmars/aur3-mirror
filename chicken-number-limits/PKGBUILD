# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-number-limits
pkgver=2.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Limit constants for numbers"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/number-limits"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=number-limits&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/number-limits.html")
md5sums=('6240e7d6ad1d46f7efb712c349aae925' 'c2902b4d5a9b734396c0c4e4504fa0a1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "number-limits-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "number-limits-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "number-limits-$pkgver/$fname"
		else
			dd iflag=fullblock of="number-limits-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/number-limits-$pkgver"
	cp ../$pkgname-$pkgver.html number-limits.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/number-limits"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "number-limits.html" "$pkgdir/usr/share/doc/$pkgname/number-limits.html"
}
