# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-37
pkgver=1.3.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: A simple and flexible command-line option parsing facility"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-37"
license=('custom:SRFI')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-37&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-37.html")
md5sums=('2983cf18e52d42eb4716d048e6e26643' 'da05836a9604dbb58dcb1c7ad724e03b')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-37-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-37-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-37-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-37-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-37-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-37.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-37"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-37.html" "$pkgdir/usr/share/doc/$pkgname/srfi-37.html"
}
