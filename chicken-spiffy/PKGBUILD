# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-spiffy
pkgver=4.8
pkgrel=4
pkgdesc="Chicken Scheme Egg: A small but powerful web server"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/spiffy"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-openssl>=1.3' 'chicken-intarweb>=0.4' 'chicken-uri-common' 'chicken-defstruct' 'chicken-sendfile>=1.7' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=spiffy&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/spiffy.html")
md5sums=('335d4a07f6525017f434b59b8f3ba880' '0e134a4ddff010237da9e52c59c52c7c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "spiffy-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "spiffy-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "spiffy-$pkgver/$fname"
		else
			dd iflag=fullblock of="spiffy-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/spiffy-$pkgver"
	cp ../$pkgname-$pkgver.html spiffy.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/spiffy"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "spiffy.html" "$pkgdir/usr/share/doc/$pkgname/spiffy.html"
}
