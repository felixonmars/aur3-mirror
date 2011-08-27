# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-c3
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Implements C3 class linearization for TinyCLOS"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/c3"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-tinyclos' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=c3&version=$pkgver"
		)
md5sums=('15922882f1c17bb7ffddd59f0786f001')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "c3-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "c3-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "c3-$pkgver/$fname"
		else
			dd iflag=fullblock of="c3-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/c3-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/c3"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
