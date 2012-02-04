# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-spiffy-request-vars
pkgver=0.12
pkgrel=4
pkgdesc="Chicken Scheme Egg: Provides easy access to variables from HTTP requests"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/spiffy-request-vars"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-intarweb>=0.3' 'chicken-uri-common' 'chicken-spiffy' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=spiffy-request-vars&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/spiffy-request-vars.html")
md5sums=('12a75241919f929f54f22cb773c9ea53' 'b0cbf85aba54def2317657c65b077461')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "spiffy-request-vars-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "spiffy-request-vars-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "spiffy-request-vars-$pkgver/$fname"
		else
			dd iflag=fullblock of="spiffy-request-vars-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/spiffy-request-vars-$pkgver"
	cp ../$pkgname-$pkgver.html spiffy-request-vars.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/spiffy-request-vars"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "spiffy-request-vars.html" "$pkgdir/usr/share/doc/$pkgname/spiffy-request-vars.html"
}
