# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-dsssl-utils
pkgver=2.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: dsssl-utils"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/dsssl-utils"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=dsssl-utils&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/dsssl-utils.html")
md5sums=('1478c56a7e740334d2995ca03d5cc6d7' '20055bb02b8707969581c116d8469b54')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "dsssl-utils-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "dsssl-utils-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "dsssl-utils-$pkgver/$fname"
		else
			dd iflag=fullblock of="dsssl-utils-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/dsssl-utils-$pkgver"
	cp ../$pkgname-$pkgver.html dsssl-utils.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/dsssl-utils"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "dsssl-utils.html" "$pkgdir/usr/share/doc/$pkgname/dsssl-utils.html"
}
