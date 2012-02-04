# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-intarweb
pkgver=0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: A more convenient HTTP library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/intarweb"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-defstruct' 'chicken-uri-common>=0.2' 'chicken-base64>=3.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=intarweb&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/intarweb.html")
md5sums=('45cbfbc43c470a757f94f14e7e5265ce' '4a718b730a08d01593531b431a7dbf40')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "intarweb-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "intarweb-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "intarweb-$pkgver/$fname"
		else
			dd iflag=fullblock of="intarweb-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/intarweb-$pkgver"
	cp ../$pkgname-$pkgver.html intarweb.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/intarweb"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "intarweb.html" "$pkgdir/usr/share/doc/$pkgname/intarweb.html"
}
