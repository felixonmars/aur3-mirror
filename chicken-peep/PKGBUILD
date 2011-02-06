# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-peep
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Explore the compiler's symbol database"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/peep"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-dissector' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=peep&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/peep.html")
md5sums=('cf26ccd49d5db49256992bc18cb43fcc' 'ad404fe8ab16feb2b68b9aa892389661')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "peep-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "peep-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "peep-$pkgver/$fname"
		else
			dd iflag=fullblock of="peep-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/peep-$pkgver"
	cp ../$pkgname-$pkgver.html peep.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/peep"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "peep.html" "$pkgdir/usr/share/doc/$pkgname/peep.html"
}
