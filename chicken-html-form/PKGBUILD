# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-html-form
pkgver=1.2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: HTML form constructor."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/html-form"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-setup-helper')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=html-form&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/html-form.html")
md5sums=('29ba72c40b553034c1fe5269c5ade4ba' 'acafbf51c369c1424cec861c02ab4132')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "html-form-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "html-form-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "html-form-$pkgver/$fname"
		else
			dd iflag=fullblock of="html-form-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/html-form-$pkgver"
	cp ../$pkgname-$pkgver.html html-form.html
	
	sed -r '/define SHARED-DIR \(chicken-home\)/ { s//define SHARED-DIR (installation-chicken-home)/; i (include "setup-helper")
}' -i.orig "html-form.setup"
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/html-form"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "html-form.html" "$pkgdir/usr/share/doc/$pkgname/html-form.html"
}
