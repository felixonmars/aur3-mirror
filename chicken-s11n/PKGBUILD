# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-s11n
pkgver=0.9.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Serialization of arbitrary data."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/s11n"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=s11n&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/s11n.html")
md5sums=('b515c6b65f4f28a98f702848f8a7f248' 'ce5501466c1b735d1eaf0a8ed0b66719')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "s11n-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "s11n-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "s11n-$pkgver/$fname"
		else
			dd iflag=fullblock of="s11n-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/s11n-$pkgver"
	cp ../$pkgname-$pkgver.html s11n.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/s11n"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "s11n.html" "$pkgdir/usr/share/doc/$pkgname/s11n.html"
}
