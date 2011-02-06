# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-php-s11n
pkgver=1.0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Serialization/unserialization of PHP data types."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/php-s11n"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-regex-literals' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=php-s11n&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/php-s11n.html")
md5sums=('8d97fb0bb2f37859e25d1a881c84976f' '269cd02b528d7aefbccfc4a670ab48f2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "php-s11n-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "php-s11n-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "php-s11n-$pkgver/$fname"
		else
			dd iflag=fullblock of="php-s11n-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/php-s11n-$pkgver"
	cp ../$pkgname-$pkgver.html php-s11n.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/php-s11n"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "php-s11n.html" "$pkgdir/usr/share/doc/$pkgname/php-s11n.html"
}
