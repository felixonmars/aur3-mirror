# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-abnf
pkgver=3.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parser combinators for Augmented BNF grammars (RFC 4234)."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/abnf"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-typeclass' 'chicken-input-classes' 'chicken-lexgen>=4.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=abnf&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/abnf.html")
md5sums=('c41389b556d2d77388e23263651b5ba1' 'aca9670329b3d8495912a1961927be14')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "abnf-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "abnf-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "abnf-$pkgver/$fname"
		else
			dd iflag=fullblock of="abnf-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/abnf-$pkgver"
	cp ../$pkgname-$pkgver.html abnf.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/abnf"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "abnf.html" "$pkgdir/usr/share/doc/$pkgname/abnf.html"
}
