# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-packrat
pkgver=1.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: A packrat parsing library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/packrat"
license=('MIT')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=packrat&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/packrat.html")
md5sums=('67f9c454fa52085609cf0090c8158c1c' 'bed10ad708591903aacef71c87a9bc8a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "packrat-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "packrat-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "packrat-$pkgver/$fname"
		else
			dd iflag=fullblock of="packrat-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/packrat-$pkgver"
	cp ../$pkgname-$pkgver.html packrat.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/packrat"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "packrat.html" "$pkgdir/usr/share/doc/$pkgname/packrat.html"
}
