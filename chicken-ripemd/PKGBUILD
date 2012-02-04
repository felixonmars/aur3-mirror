# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-ripemd
pkgver=1.0.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: RIPE Message Digest"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ripemd"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-message-digest>=2.3.1' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=ripemd&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/ripemd.html")
md5sums=('f86e2613bdd8e17b0b10adc62842009f' '44a0830218b19ce132fa098642b887a2')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "ripemd-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "ripemd-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "ripemd-$pkgver/$fname"
		else
			dd iflag=fullblock of="ripemd-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/ripemd-$pkgver"
	cp ../$pkgname-$pkgver.html ripemd.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/ripemd"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "ripemd.html" "$pkgdir/usr/share/doc/$pkgname/ripemd.html"
}
