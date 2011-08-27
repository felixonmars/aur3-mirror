# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sandbox
pkgver=1.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: A safe evaluation environment"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sandbox"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sandbox&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sandbox.html")
md5sums=('db577ac14adbfa623234454bf674b25f' '624cf560ae54161217857f4d19153374')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sandbox-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sandbox-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sandbox-$pkgver/$fname"
		else
			dd iflag=fullblock of="sandbox-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sandbox-$pkgver"
	cp ../$pkgname-$pkgver.html sandbox.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sandbox"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sandbox.html" "$pkgdir/usr/share/doc/$pkgname/sandbox.html"
}
