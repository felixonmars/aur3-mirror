# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-9-ext
pkgver=1.0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: srfi-9-ext"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-9-ext"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-9-ext&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-9-ext.html")
md5sums=('f57047f8e409d5c6d322b777eeac3f49' '95877e8f4dd2726099d7fe750a8749fe')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-9-ext-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-9-ext-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-9-ext-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-9-ext-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-9-ext-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-9-ext.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-9-ext"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-9-ext.html" "$pkgdir/usr/share/doc/$pkgname/srfi-9-ext.html"
}
