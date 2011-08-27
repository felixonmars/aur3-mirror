# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-salmonella
pkgver=1.16
pkgrel=4
pkgdesc="Chicken Scheme Egg: A tool for testing eggs"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/salmonella"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=salmonella&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/salmonella.html")
md5sums=('9017777fdc4dba50e71e5ef6c1ca25e4' '9069b965bbb8af6b31ea0adaf3c04e5e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "salmonella-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "salmonella-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "salmonella-$pkgver/$fname"
		else
			dd iflag=fullblock of="salmonella-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/salmonella-$pkgver"
	cp ../$pkgname-$pkgver.html salmonella.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/salmonella"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "salmonella.html" "$pkgdir/usr/share/doc/$pkgname/salmonella.html"
}
