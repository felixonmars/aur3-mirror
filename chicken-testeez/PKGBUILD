# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-testeez
pkgver=0.3.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Simple Test Mechanism for Scheme"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/testeez"
license=('LGPL')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=testeez&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/testeez.html")
md5sums=('87fcd512e01021f8ce70afeb1e251e89' '42e870e9aaa3940337ef863cf430aab2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "testeez-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "testeez-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "testeez-$pkgver/$fname"
		else
			dd iflag=fullblock of="testeez-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/testeez-$pkgver"
	cp ../$pkgname-$pkgver.html testeez.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/testeez"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "testeez.html" "$pkgdir/usr/share/doc/$pkgname/testeez.html"
}
