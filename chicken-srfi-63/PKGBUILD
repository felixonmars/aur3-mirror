# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-63
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Homogeneous and heterogeneous arrays"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-63"
license=('custom:Artistic')
depends=('chicken>=4.5.0' 'chicken-records' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-63&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-63.html")
md5sums=('27abd34bee87c202f905f9066e93a253' '33f422ee77cda32709b40a9fdc6b2c56')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-63-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-63-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-63-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-63-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-63-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-63.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-63"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-63.html" "$pkgdir/usr/share/doc/$pkgname/srfi-63.html"
}
