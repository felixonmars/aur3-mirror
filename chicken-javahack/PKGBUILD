# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-javahack
pkgver=0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: A simple interface to Java(tm)"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/javahack"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=javahack&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/javahack.html")
md5sums=('797eccc76134d84515dc3867c3209a25' 'e3d7743928f8796d9d0cac6745bdef1d')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "javahack-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "javahack-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "javahack-$pkgver/$fname"
		else
			dd iflag=fullblock of="javahack-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/javahack-$pkgver"
	cp ../$pkgname-$pkgver.html javahack.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/javahack"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "javahack.html" "$pkgdir/usr/share/doc/$pkgname/javahack.html"
}
