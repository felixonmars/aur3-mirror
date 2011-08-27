# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-yasos
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A very simple OOP system"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/yasos"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=yasos&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/yasos.html")
md5sums=('a954afeb27605e9568a34168700839d0' '955c6b07ac97c6ae25e834d1538905f6')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "yasos-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "yasos-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "yasos-$pkgver/$fname"
		else
			dd iflag=fullblock of="yasos-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/yasos-$pkgver"
	cp ../$pkgname-$pkgver.html yasos.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/yasos"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "yasos.html" "$pkgdir/usr/share/doc/$pkgname/yasos.html"
}
