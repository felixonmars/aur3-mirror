# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-htmlprag
pkgver=0.16.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A permissive HTML parser"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/htmlprag"
license=('LGPL')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=htmlprag&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/htmlprag.html")
md5sums=('4ebe9641f2f1a795f432d756df1e84f6' 'aabc7b87c2339cd9d794d0f9ef735a66')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "htmlprag-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "htmlprag-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "htmlprag-$pkgver/$fname"
		else
			dd iflag=fullblock of="htmlprag-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/htmlprag-$pkgver"
	cp ../$pkgname-$pkgver.html htmlprag.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/htmlprag"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "htmlprag.html" "$pkgdir/usr/share/doc/$pkgname/htmlprag.html"
}
