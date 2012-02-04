# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sxml-serializer
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Serialize SXML to XML and HTML"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sxml-serializer"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sxml-serializer&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sxml-serializer.html")
md5sums=('d8423111d2d82d33024080d27aa6e306' '4dec1b8fd34431ffb3f3f2a75c329ecb')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sxml-serializer-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sxml-serializer-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sxml-serializer-$pkgver/$fname"
		else
			dd iflag=fullblock of="sxml-serializer-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sxml-serializer-$pkgver"
	cp ../$pkgname-$pkgver.html sxml-serializer.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sxml-serializer"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sxml-serializer.html" "$pkgdir/usr/share/doc/$pkgname/sxml-serializer.html"
}
