# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sparse-vectors
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Arbitrarily large vectors"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sparse-vectors"
license=('BSD')
#depends=('chicken>=4.5.0'  'chicken-numbers' 'chicken-datatype')
depends=('chicken>=4.5.0')
conflicts=(chicken-numbers)
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sparse-vectors&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sparse-vectors.html")
md5sums=('c21bdab64fd70cd012ae9f34485b4323' 'f5f7aecde493ec7b9cdf33ab4129e55d')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sparse-vectors-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sparse-vectors-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sparse-vectors-$pkgver/$fname"
		else
			dd iflag=fullblock of="sparse-vectors-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sparse-vectors-$pkgver"
	cp ../$pkgname-$pkgver.html sparse-vectors.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sparse-vectors"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sparse-vectors.html" "$pkgdir/usr/share/doc/$pkgname/sparse-vectors.html"
}
