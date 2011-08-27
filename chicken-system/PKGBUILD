# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-system
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: load and compile groups of files"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/system"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-coops' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=system&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/system.html")
md5sums=('96c13296c072e179757b1c8fa3d2dcda' 'dd1d0d13af1eeeb0e3ddb1410cff2c15')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "system-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "system-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "system-$pkgver/$fname"
		else
			dd iflag=fullblock of="system-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/system-$pkgver"
	cp ../$pkgname-$pkgver.html system.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/system"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "system.html" "$pkgdir/usr/share/doc/$pkgname/system.html"
}
