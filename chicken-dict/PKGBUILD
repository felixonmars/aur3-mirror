# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-dict
pkgver=2.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: rfc2229 client api"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/dict"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-defstruct' 'chicken-md5' 'chicken-utf8' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=dict&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/dict.html")
md5sums=('dbd72c298094475bbac4bb27e17420f5' '61757bbaafeb9e0f487370747e8f026c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "dict-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "dict-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "dict-$pkgver/$fname"
		else
			dd iflag=fullblock of="dict-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/dict-$pkgver"
	cp ../$pkgname-$pkgver.html dict.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/dict"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "dict.html" "$pkgdir/usr/share/doc/$pkgname/dict.html"
}
