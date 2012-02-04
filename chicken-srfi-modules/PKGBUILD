# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-srfi-modules
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Provides modules for SRFIs usually exported by the 'chicken' module"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-modules"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=srfi-modules&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/srfi-modules.html")
md5sums=('ac2f6efb336e000c1aa5fed83cf2f1b7' '57155f5b134fd5bb101bce4b65cc55d2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "srfi-modules-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "srfi-modules-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "srfi-modules-$pkgver/$fname"
		else
			dd iflag=fullblock of="srfi-modules-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/srfi-modules-$pkgver"
	cp ../$pkgname-$pkgver.html srfi-modules.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/srfi-modules"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "srfi-modules.html" "$pkgdir/usr/share/doc/$pkgname/srfi-modules.html"
}
