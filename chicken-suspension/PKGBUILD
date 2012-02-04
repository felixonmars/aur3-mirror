# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-suspension
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Serialized limited continuations"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/suspension"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-s11n' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=suspension&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/suspension.html")
md5sums=('30effc1271ed21f258a4542e1da7cd39' 'c5c7492b7fa50d2c0110a4125a0dc7cf')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "suspension-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "suspension-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "suspension-$pkgver/$fname"
		else
			dd iflag=fullblock of="suspension-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/suspension-$pkgver"
	cp ../$pkgname-$pkgver.html suspension.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/suspension"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "suspension.html" "$pkgdir/usr/share/doc/$pkgname/suspension.html"
}
