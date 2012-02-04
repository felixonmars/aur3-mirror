# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sxpath
pkgver=0.1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: The sxpath bits of sxml-tools from the SSAX project at Sourceforge"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sxpath"
license=('public')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sxpath&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sxpath.html")
md5sums=('678c67f274fe38d315ac4389b0686915' 'bf2c072059fa122cbc2a6a577931e87f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sxpath-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sxpath-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sxpath-$pkgver/$fname"
		else
			dd iflag=fullblock of="sxpath-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sxpath-$pkgver"
	cp ../$pkgname-$pkgver.html sxpath.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sxpath"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sxpath.html" "$pkgdir/usr/share/doc/$pkgname/sxpath.html"
}
