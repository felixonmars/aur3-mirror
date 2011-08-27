# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-rb-tree
pkgver=3.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A sorted dictionary data structure based on red-black trees."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/rb-tree"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=rb-tree&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/rb-tree.html")
md5sums=('9ead3564c1209b2d76b79350a0e12160' '59194c528d6ce144c144c5d76d8a37bb')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "rb-tree-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "rb-tree-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "rb-tree-$pkgver/$fname"
		else
			dd iflag=fullblock of="rb-tree-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/rb-tree-$pkgver"
	cp ../$pkgname-$pkgver.html rb-tree.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/rb-tree"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "rb-tree.html" "$pkgdir/usr/share/doc/$pkgname/rb-tree.html"
}
