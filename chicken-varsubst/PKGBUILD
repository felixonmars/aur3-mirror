# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-varsubst
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parameterized variable substitution procedures."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/varsubst"
license=('GPL3')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=varsubst&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/varsubst.html")
md5sums=('7b99c8e1c67becc2c580aea70ef70412' 'ae8d191add5bb5fceff7b00b6ab87402')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "varsubst-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "varsubst-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "varsubst-$pkgver/$fname"
		else
			dd iflag=fullblock of="varsubst-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/varsubst-$pkgver"
	cp ../$pkgname-$pkgver.html varsubst.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/varsubst"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "varsubst.html" "$pkgdir/usr/share/doc/$pkgname/varsubst.html"
}
