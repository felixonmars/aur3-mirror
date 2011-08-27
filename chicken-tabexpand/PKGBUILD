# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-tabexpand
pkgver=1.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: Tab Character Expansion in Scheme"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tabexpand"
license=('LGPL')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=tabexpand&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/tabexpand.html")
md5sums=('2e957922f44e06980dea7d0ad2626348' 'd01fa44862137bf885ef65b5a24f05a1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "tabexpand-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "tabexpand-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "tabexpand-$pkgver/$fname"
		else
			dd iflag=fullblock of="tabexpand-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/tabexpand-$pkgver"
	cp ../$pkgname-$pkgver.html tabexpand.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/tabexpand"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "tabexpand.html" "$pkgdir/usr/share/doc/$pkgname/tabexpand.html"
}
