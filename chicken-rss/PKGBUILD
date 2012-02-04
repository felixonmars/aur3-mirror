# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-rss
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: A RSS parser"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/rss"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-ssax' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=rss&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/rss.html")
md5sums=('5c619ff6ce3e2ac032cca2688429045c' 'a4064038178224417f86f64984a77907')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "rss-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "rss-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "rss-$pkgver/$fname"
		else
			dd iflag=fullblock of="rss-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/rss-$pkgver"
	cp ../$pkgname-$pkgver.html rss.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/rss"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "rss.html" "$pkgdir/usr/share/doc/$pkgname/rss.html"
}
