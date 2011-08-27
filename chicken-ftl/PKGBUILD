# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-ftl
pkgver=0.6
pkgrel=4
pkgdesc="Chicken Scheme Egg: Interface based sequence library"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ftl"
license=('LGPL')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=ftl&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/ftl.html")
md5sums=('4941c3174066fac1f6a567d0781f63fd' '5cb97fb9d5902bd262fb27c68c243dd2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "ftl-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "ftl-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "ftl-$pkgver/$fname"
		else
			dd iflag=fullblock of="ftl-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/ftl-$pkgver"
	cp ../$pkgname-$pkgver.html ftl.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/ftl"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "ftl.html" "$pkgdir/usr/share/doc/$pkgname/ftl.html"
}
