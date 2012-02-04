# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-blas
pkgver=2.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to level 1, 2 and 3 BLAS routines"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/blas"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'gsl')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=blas&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/blas.html")
md5sums=('11e97d7aa350bd70184b7b6285f7afd6' '5d5643d864cab5d4565ad4186ab106c3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "blas-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "blas-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "blas-$pkgver/$fname"
		else
			dd iflag=fullblock of="blas-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/blas-$pkgver"
	cp ../$pkgname-$pkgver.html blas.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/blas"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "blas.html" "$pkgdir/usr/share/doc/$pkgname/blas.html"
}
