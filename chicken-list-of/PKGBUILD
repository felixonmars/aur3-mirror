# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-list-of
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Simple list-comprehensions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/list-of"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=list-of&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/list-of.html")
md5sums=('1ccf78722c152577a84acfa81139df54' 'db8557e0821821d6231553114ecb3d5a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "list-of-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "list-of-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "list-of-$pkgver/$fname"
		else
			dd iflag=fullblock of="list-of-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/list-of-$pkgver"
	cp ../$pkgname-$pkgver.html list-of.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/list-of"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "list-of.html" "$pkgdir/usr/share/doc/$pkgname/list-of.html"
}
