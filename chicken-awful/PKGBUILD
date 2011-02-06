# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-awful
pkgver=0.26
pkgrel=4
pkgdesc="Chicken Scheme Egg: awful provides an application and an extension to ease the development of web-based applications."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/awful"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-spiffy>=4.2' 'chicken-spiffy-request-vars>=0.8' 'chicken-html-tags' 'chicken-html-utils' 'chicken-http-session>=2.0' 'chicken-json' 'chicken-spiffy-cookies' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=awful&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/awful.html")
md5sums=('cee03a4107826811cc36068e94f9f455' '4ad46ad4f331272efa17f7a93fc05243')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "awful-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "awful-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "awful-$pkgver/$fname"
		else
			dd iflag=fullblock of="awful-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/awful-$pkgver"
	cp ../$pkgname-$pkgver.html awful.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/awful"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "awful.html" "$pkgdir/usr/share/doc/$pkgname/awful.html"
}
