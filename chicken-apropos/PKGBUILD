# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-apropos
pkgver=1.4.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Chicken apropos"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/apropos"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-string-utils>=1.0.0' 'chicken-symbol-utils>=1.0.0' 'chicken-check-errors>=1.9.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=apropos&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/apropos.html")
md5sums=('4350cac501568920e014b44d4b29750b' 'bc58e0a968e4d9462fa7df376f60668d')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "apropos-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "apropos-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "apropos-$pkgver/$fname"
		else
			dd iflag=fullblock of="apropos-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/apropos-$pkgver"
	cp ../$pkgname-$pkgver.html apropos.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/apropos"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "apropos.html" "$pkgdir/usr/share/doc/$pkgname/apropos.html"
}
