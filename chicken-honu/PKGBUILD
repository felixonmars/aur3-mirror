# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-honu
pkgver=1.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: A parser for 'honu' syntax"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/honu"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=honu&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/honu.html")
md5sums=('6b05b038015c4bd7aa515cc36224b956' 'dc5d0eaf537e433b3d8ff02eb64829cc')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "honu-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "honu-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "honu-$pkgver/$fname"
		else
			dd iflag=fullblock of="honu-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/honu-$pkgver"
	cp ../$pkgname-$pkgver.html honu.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/honu"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "honu.html" "$pkgdir/usr/share/doc/$pkgname/honu.html"
}
