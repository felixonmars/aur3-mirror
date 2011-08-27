# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-doctype
pkgver=2.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Exports strings corresponding to standard XML (XHTML, HTML) doctypes"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/doctype"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=doctype&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/doctype.html")
md5sums=('b0cb7604255a2808d9699ce1de80462f' '2158c17549dcb1541b121f6ace11ad2a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "doctype-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "doctype-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "doctype-$pkgver/$fname"
		else
			dd iflag=fullblock of="doctype-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/doctype-$pkgver"
	cp ../$pkgname-$pkgver.html doctype.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/doctype"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "doctype.html" "$pkgdir/usr/share/doc/$pkgname/doctype.html"
}
