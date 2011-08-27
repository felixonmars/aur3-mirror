# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-eggdoc
pkgver=1.3.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: An egg documentation tool"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/eggdoc"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sxml-transforms' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=eggdoc&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/eggdoc.html")
md5sums=('d7547d037eeba080d7317b163a9b1048' '4833306c2458085c72a447165dbb7178')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "eggdoc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "eggdoc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "eggdoc-$pkgver/$fname"
		else
			dd iflag=fullblock of="eggdoc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/eggdoc-$pkgver"
	cp ../$pkgname-$pkgver.html eggdoc.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/eggdoc"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "eggdoc.html" "$pkgdir/usr/share/doc/$pkgname/eggdoc.html"
}
