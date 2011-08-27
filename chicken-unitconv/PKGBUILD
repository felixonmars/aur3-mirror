# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-unitconv
pkgver=2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Conversion of units of measurement"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/unitconv"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' 'chicken-matchable' 'chicken-numbers' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=unitconv&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/unitconv.html")
md5sums=('06480af778ed15377ce91f6cb4cdefd5' 'f6fff793b4bf3ffcd11a72d712db8940')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "unitconv-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "unitconv-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "unitconv-$pkgver/$fname"
		else
			dd iflag=fullblock of="unitconv-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/unitconv-$pkgver"
	cp ../$pkgname-$pkgver.html unitconv.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/unitconv"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "unitconv.html" "$pkgdir/usr/share/doc/$pkgname/unitconv.html"
}
