# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-f-operator
pkgver=2.0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Shift/Reset Control Operators."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/F-operator"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros' 'chicken-datatype' 'chicken-box' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=F-operator&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/F-operator.html")
md5sums=('31bf0f3eb32041e190cbb39e170d47ff' 'a1ecffcf5e4aaddefc0ead9f447fdba3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "f-operator-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "f-operator-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "f-operator-$pkgver/$fname"
		else
			dd iflag=fullblock of="f-operator-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/f-operator-$pkgver"
	cp ../$pkgname-$pkgver.html F-operator.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/f-operator"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "F-operator.html" "$pkgdir/usr/share/doc/$pkgname/F-operator.html"
}
