# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-eggdoc-svnwiki
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Render eggdoc source to svnwiki syntax"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/eggdoc-svnwiki"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sxml-transforms' 'chicken-sxpath' 'chicken-eggdoc' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=eggdoc-svnwiki&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/eggdoc-svnwiki.html")
md5sums=('e60e0aa763aafe6f33582a8f3a91477e' 'b578f53ebe4937628ac3a95c5f67947c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "eggdoc-svnwiki-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "eggdoc-svnwiki-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "eggdoc-svnwiki-$pkgver/$fname"
		else
			dd iflag=fullblock of="eggdoc-svnwiki-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/eggdoc-svnwiki-$pkgver"
	cp ../$pkgname-$pkgver.html eggdoc-svnwiki.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/eggdoc-svnwiki"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "eggdoc-svnwiki.html" "$pkgdir/usr/share/doc/$pkgname/eggdoc-svnwiki.html"
}
