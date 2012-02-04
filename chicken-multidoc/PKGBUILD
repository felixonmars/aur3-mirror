# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-multidoc
pkgver=2.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Converts SXML to various document formats."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/multidoc"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-datatype' 'chicken-sxml-transforms' 'chicken-doctype' 'chicken-uri-generic' 'chicken-sxpath' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=multidoc&version=$pkgver"
		)
md5sums=('8f4a7ae38f1a8c001d778bff4cdf1218')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "multidoc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "multidoc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "multidoc-$pkgver/$fname"
		else
			dd iflag=fullblock of="multidoc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/multidoc-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/multidoc"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
