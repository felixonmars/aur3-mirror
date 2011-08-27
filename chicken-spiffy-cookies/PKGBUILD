# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-spiffy-cookies
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Procedures for managing cookies"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/spiffy-cookies"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-spiffy' 'chicken-intarweb' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=spiffy-cookies&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/spiffy-cookies.html")
md5sums=('bdc2454b72cbb4c2e6f9105ae627a838' 'a0f462e8bd701c449747694884d7325f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "spiffy-cookies-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "spiffy-cookies-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "spiffy-cookies-$pkgver/$fname"
		else
			dd iflag=fullblock of="spiffy-cookies-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/spiffy-cookies-$pkgver"
	cp ../$pkgname-$pkgver.html spiffy-cookies.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/spiffy-cookies"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "spiffy-cookies.html" "$pkgdir/usr/share/doc/$pkgname/spiffy-cookies.html"
}
