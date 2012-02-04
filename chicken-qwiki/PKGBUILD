# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-qwiki
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: qwiki - the quick wiki"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/qwiki"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-intarweb' 'chicken-uri-common>=1.0' 'chicken-spiffy>=4.8' 'chicken-doctype>=1.2' 'chicken-sxml-transforms>=1.4' 'chicken-multidoc' 'chicken-svn-client>=0.13' 'chicken-estraier-client' 'chicken-sxpath' 'chicken-sha1' 'chicken-svnwiki-sxml>=0.2.1' 'chicken-html-parser' 'chicken-colorize' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=qwiki&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/qwiki.html")
md5sums=('223a1d6b8f1e329273a1481c024dcc3f' '8a15f9adef872a5f9f50a451affc39b8')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "qwiki-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "qwiki-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "qwiki-$pkgver/$fname"
		else
			dd iflag=fullblock of="qwiki-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/qwiki-$pkgver"
	cp ../$pkgname-$pkgver.html qwiki.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/qwiki"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "qwiki.html" "$pkgdir/usr/share/doc/$pkgname/qwiki.html"
}
