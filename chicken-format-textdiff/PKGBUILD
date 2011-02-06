# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-format-textdiff
pkgver=1.8
pkgrel=4
pkgdesc="Chicken Scheme Egg: Output text diff scripts in different formats"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/format-textdiff"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-npdiff' 'chicken-vector-lib' 'chicken-dyn-vector' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=format-textdiff&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/format-textdiff.html")
md5sums=('8b91d806fb2f87da8b23392378a64bbf' '1bbf95807e1e63a9c28468dd5bcbce53')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "format-textdiff-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "format-textdiff-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "format-textdiff-$pkgver/$fname"
		else
			dd iflag=fullblock of="format-textdiff-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/format-textdiff-$pkgver"
	cp ../$pkgname-$pkgver.html format-textdiff.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/format-textdiff"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "format-textdiff.html" "$pkgdir/usr/share/doc/$pkgname/format-textdiff.html"
}
