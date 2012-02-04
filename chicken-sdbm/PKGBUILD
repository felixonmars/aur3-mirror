# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sdbm
pkgver=0.1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: SDBM clone"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sdbm"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sdbm&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sdbm.html")
md5sums=('8da20da4e90c3c55d267480912d173dc' '2179afb32457a11fcd4534e36bfcefe4')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sdbm-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sdbm-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sdbm-$pkgver/$fname"
		else
			dd iflag=fullblock of="sdbm-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sdbm-$pkgver"
	cp ../$pkgname-$pkgver.html sdbm.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sdbm"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sdbm.html" "$pkgdir/usr/share/doc/$pkgname/sdbm.html"
}
