# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-regex-literals
pkgver=1.0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A reader extension providing precompiled regular expression literals of the form <code>#/[a-z0-9]+/i</code>"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/regex-literals"
license=('MIT')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=regex-literals&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/regex-literals.html")
md5sums=('d530f72ff4fb8f3a9ed0a30edee40aea' 'e3df40f1f9aadacb94e74b41dfc43da1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "regex-literals-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "regex-literals-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "regex-literals-$pkgver/$fname"
		else
			dd iflag=fullblock of="regex-literals-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/regex-literals-$pkgver"
	cp ../$pkgname-$pkgver.html regex-literals.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/regex-literals"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "regex-literals.html" "$pkgdir/usr/share/doc/$pkgname/regex-literals.html"
}
