# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-numspell
pkgver=0.5
pkgrel=4
pkgdesc="Chicken Scheme Egg: Spelling Numbers as English in Scheme"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/numspell"
license=('LGPL')
depends=('chicken>=4.5.0' 'chicken-numbers' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=numspell&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/numspell.html")
md5sums=('7d987a7ce3f335a6157fe3b758cfde16' '34763d72d809c2e75b043edfdb093c6a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "numspell-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "numspell-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "numspell-$pkgver/$fname"
		else
			dd iflag=fullblock of="numspell-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/numspell-$pkgver"
	cp ../$pkgname-$pkgver.html numspell.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/numspell"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "numspell.html" "$pkgdir/usr/share/doc/$pkgname/numspell.html"
}
