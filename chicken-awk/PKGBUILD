# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-awk
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: The SCSH/PLT 'awk' macro"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/awk"
license=('custom:LGPL-1')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=awk&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/awk.html")
md5sums=('4a05983b68d7484df99fb914819b64c9' '7c7f70aad91a23b6f5765b7787163c8a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "awk-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "awk-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "awk-$pkgver/$fname"
		else
			dd iflag=fullblock of="awk-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/awk-$pkgver"
	cp ../$pkgname-$pkgver.html awk.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/awk"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "awk.html" "$pkgdir/usr/share/doc/$pkgname/awk.html"
}
