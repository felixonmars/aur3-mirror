# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-iconv
pkgver=1.8
pkgrel=4
pkgdesc="Chicken Scheme Egg: Character-set conversions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/iconv"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=iconv&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/iconv.html")
md5sums=('326b2cec9112932aba65698ba3a2ae7b' '3507e1f8ad65113dc4affc33cd3337b3')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "iconv-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "iconv-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "iconv-$pkgver/$fname"
		else
			dd iflag=fullblock of="iconv-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/iconv-$pkgver"
	cp ../$pkgname-$pkgver.html iconv.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/iconv"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "iconv.html" "$pkgdir/usr/share/doc/$pkgname/iconv.html"
}
