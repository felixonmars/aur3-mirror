# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-s48-modules
pkgver=0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: basic Scheme48 module syntax"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/s48-modules"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=s48-modules&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/s48-modules.html")
md5sums=('33b26b57f730c8063497c19a78e6c797' '4fe81a3a6dba987b5cb13304635d020e')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "s48-modules-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "s48-modules-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "s48-modules-$pkgver/$fname"
		else
			dd iflag=fullblock of="s48-modules-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/s48-modules-$pkgver"
	cp ../$pkgname-$pkgver.html s48-modules.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/s48-modules"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "s48-modules.html" "$pkgdir/usr/share/doc/$pkgname/s48-modules.html"
}
