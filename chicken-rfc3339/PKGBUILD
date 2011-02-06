# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-rfc3339
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: RFC3339 datetime parser"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/rfc3339"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=rfc3339&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/rfc3339.html")
md5sums=('ad9281b240c7161e62d03f8bdd679fc6' '4253b6277b4b34ddadbc26d697b0f3ad')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "rfc3339-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "rfc3339-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "rfc3339-$pkgver/$fname"
		else
			dd iflag=fullblock of="rfc3339-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/rfc3339-$pkgver"
	cp ../$pkgname-$pkgver.html rfc3339.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/rfc3339"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "rfc3339.html" "$pkgdir/usr/share/doc/$pkgname/rfc3339.html"
}
