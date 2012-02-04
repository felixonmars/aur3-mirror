# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-treap
pkgver=1.6
pkgrel=4
pkgdesc="Chicken Scheme Egg: A sorted dictionary data structure based on randomized search trees."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/treap"
license=('GPL3')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=treap&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/treap.html")
md5sums=('def0b0b86300f1bdb094f3b9412ebee7' '507d6def4c5487c94491e1b41b8f5ed0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "treap-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "treap-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "treap-$pkgver/$fname"
		else
			dd iflag=fullblock of="treap-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/treap-$pkgver"
	cp ../$pkgname-$pkgver.html treap.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/treap"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "treap.html" "$pkgdir/usr/share/doc/$pkgname/treap.html"
}
