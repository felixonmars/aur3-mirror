# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-pdf
pkgver=1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: A library for PDF generation."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/pdf"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-format' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=pdf&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/pdf.html")
md5sums=('14df0f837fb8934c9f7fdfe9ef91f46e' 'c90e131c1cb301de0428e482c2dfd354')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "pdf-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "pdf-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "pdf-$pkgver/$fname"
		else
			dd iflag=fullblock of="pdf-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/pdf-$pkgver"
	cp ../$pkgname-$pkgver.html pdf.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/pdf"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "pdf.html" "$pkgdir/usr/share/doc/$pkgname/pdf.html"
}
