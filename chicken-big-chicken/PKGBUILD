# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-big-chicken
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A convenience module that re-exports most non-standard libraries"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/big-chicken"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=big-chicken&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/big-chicken.html")
md5sums=('193de50dd5cfa82b997a7cb89c1cff16' '260a5751ebf6c65694c20973d8fb61c1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "big-chicken-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "big-chicken-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "big-chicken-$pkgver/$fname"
		else
			dd iflag=fullblock of="big-chicken-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/big-chicken-$pkgver"
	cp ../$pkgname-$pkgver.html big-chicken.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/big-chicken"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "big-chicken.html" "$pkgdir/usr/share/doc/$pkgname/big-chicken.html"
}
