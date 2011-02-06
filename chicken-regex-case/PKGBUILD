# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-regex-case
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Provides an easy to use <code>case</code> construct for regular expression matching"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/regex-case"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-regex' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=regex-case&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/regex-case.html")
md5sums=('134451bade7a1c65c54d532ceb26bb46' '8467135278c716faa9a36219438ee0a4')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "regex-case-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "regex-case-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "regex-case-$pkgver/$fname"
		else
			dd iflag=fullblock of="regex-case-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/regex-case-$pkgver"
	cp ../$pkgname-$pkgver.html regex-case.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/regex-case"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "regex-case.html" "$pkgdir/usr/share/doc/$pkgname/regex-case.html"
}
