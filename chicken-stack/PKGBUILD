# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-stack
pkgver=2.1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Provides LIFO queue (stack) operations"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/stack"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors>=1.9.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=stack&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/stack.html")
md5sums=('72a773ec0333f1688535e9693f96a72a' 'bc773f25871dee5c0b84d7db18a49e39')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "stack-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "stack-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "stack-$pkgver/$fname"
		else
			dd iflag=fullblock of="stack-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/stack-$pkgver"
	cp ../$pkgname-$pkgver.html stack.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/stack"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "stack.html" "$pkgdir/usr/share/doc/$pkgname/stack.html"
}
