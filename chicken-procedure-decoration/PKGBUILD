# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-procedure-decoration
pkgver=2.0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Procedure Decoration API"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/procedure-decoration"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=procedure-decoration&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/procedure-decoration.html")
md5sums=('601d0d94272739b6b79ca34bd3afdd2b' '6ec178f7420ff202849ad13869e948df')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "procedure-decoration-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "procedure-decoration-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "procedure-decoration-$pkgver/$fname"
		else
			dd iflag=fullblock of="procedure-decoration-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/procedure-decoration-$pkgver"
	cp ../$pkgname-$pkgver.html procedure-decoration.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/procedure-decoration"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "procedure-decoration.html" "$pkgdir/usr/share/doc/$pkgname/procedure-decoration.html"
}
