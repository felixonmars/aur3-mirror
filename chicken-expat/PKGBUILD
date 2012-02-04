# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-expat
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to James Clark's Expat XML parser"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/expat"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-silex' 'chicken-easyffi' 'expat')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=expat&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/expat.html")
md5sums=('cff8feddbbc2a31ef14138c5f3e7728a' 'a1614f3d9bc7e54794c7a85466661243')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "expat-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "expat-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "expat-$pkgver/$fname"
		else
			dd iflag=fullblock of="expat-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/expat-$pkgver"
	cp ../$pkgname-$pkgver.html expat.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/expat"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "expat.html" "$pkgdir/usr/share/doc/$pkgname/expat.html"
}
