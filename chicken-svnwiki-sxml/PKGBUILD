# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-svnwiki-sxml
pkgver=0.2.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parse svnwiki to sxml"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/svnwiki-sxml"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-html-parser' 'chicken-sxml-transforms' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=svnwiki-sxml&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/svnwiki-sxml.html")
md5sums=('91382465913fae263b58464f3c3fa444' 'e91a32160383a774064c249e1541a902')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "svnwiki-sxml-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "svnwiki-sxml-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "svnwiki-sxml-$pkgver/$fname"
		else
			dd iflag=fullblock of="svnwiki-sxml-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/svnwiki-sxml-$pkgver"
	cp ../$pkgname-$pkgver.html svnwiki-sxml.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/svnwiki-sxml"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "svnwiki-sxml.html" "$pkgdir/usr/share/doc/$pkgname/svnwiki-sxml.html"
}
