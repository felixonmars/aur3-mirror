# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-protobj
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A prototype-delegation object model"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/protobj"
license=('LGPL')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=protobj&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/protobj.html")
md5sums=('a3f99a80408f480690069e04fb9474cf' '2938e5e48df5768ad20d90bfe895dad8')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "protobj-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "protobj-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "protobj-$pkgver/$fname"
		else
			dd iflag=fullblock of="protobj-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/protobj-$pkgver"
	cp ../$pkgname-$pkgver.html protobj.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/protobj"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "protobj.html" "$pkgdir/usr/share/doc/$pkgname/protobj.html"
}
