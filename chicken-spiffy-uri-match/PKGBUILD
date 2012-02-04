# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-spiffy-uri-match
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: uri-match integration for spiffy"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/spiffy-uri-match"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-uri-match' 'chicken-spiffy' 'chicken-uri-common' 'chicken-intarweb' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=spiffy-uri-match&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/spiffy-uri-match.html")
md5sums=('c9e54fda6115becc081f383a311741a5' '973a2a45bb105662cb79ebf2426dea06')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "spiffy-uri-match-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "spiffy-uri-match-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "spiffy-uri-match-$pkgver/$fname"
		else
			dd iflag=fullblock of="spiffy-uri-match-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/spiffy-uri-match-$pkgver"
	cp ../$pkgname-$pkgver.html spiffy-uri-match.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/spiffy-uri-match"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "spiffy-uri-match.html" "$pkgdir/usr/share/doc/$pkgname/spiffy-uri-match.html"
}
