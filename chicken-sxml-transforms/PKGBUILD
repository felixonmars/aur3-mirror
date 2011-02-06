# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sxml-transforms
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: The SXML transformations (to XML, SXML, and HTML) from the SSAX project at Sourceforge"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sxml-transforms"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sxml-transforms&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sxml-transforms.html")
md5sums=('a01ede6773e6c73b8a58ec1d19ec2192' '2bb3181c3c5baacafe0a35e62a2a379a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sxml-transforms-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sxml-transforms-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sxml-transforms-$pkgver/$fname"
		else
			dd iflag=fullblock of="sxml-transforms-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sxml-transforms-$pkgver"
	cp ../$pkgname-$pkgver.html sxml-transforms.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sxml-transforms"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sxml-transforms.html" "$pkgdir/usr/share/doc/$pkgname/sxml-transforms.html"
}
