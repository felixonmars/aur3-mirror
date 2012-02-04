# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-random-mtzig
pkgver=2.9
pkgrel=4
pkgdesc="Chicken Scheme Egg: An implementation of the MT19937 random number generator with Marsaglia and Tang's Ziggurat algorithm to generate random numbers from a non-uniform distribution."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/random-mtzig"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=random-mtzig&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/random-mtzig.html")
md5sums=('4a99e81cad89d04b59edf3f86d1fc9aa' '466840c41159d190cb7ff8a91832f494')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "random-mtzig-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "random-mtzig-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "random-mtzig-$pkgver/$fname"
		else
			dd iflag=fullblock of="random-mtzig-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/random-mtzig-$pkgver"
	cp ../$pkgname-$pkgver.html random-mtzig.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/random-mtzig"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "random-mtzig.html" "$pkgdir/usr/share/doc/$pkgname/random-mtzig.html"
}
