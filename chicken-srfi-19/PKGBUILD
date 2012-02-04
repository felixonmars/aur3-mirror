# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-19
pkgver=3.1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Time Data Types and Procedures"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-19"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper>=1.1.1' 'chicken-numbers' 'chicken-miscmacros' 'chicken-locale>=0.6.2' 'chicken-srfi-29>=2.0.1' 'chicken-check-errors>=1.7.0' 'chicken-record-variants>=0.5' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-19&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-19.html")
md5sums=('cfb33a5cc593dddbfefe187f4f870e9d' 'e1c403fc2770e6999d9bc4cb0470d53f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-19-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-19-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-19-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-19-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-19-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-19.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-19"
		mkdir -p "$pkgdir/usr/lib/chicken/5/srfi-29-bundles"
	
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-19.html" "$pkgdir/usr/share/doc/$pkgname/srfi-19.html"
}
