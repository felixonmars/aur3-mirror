# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-gdbm
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: GNU DBM interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/gdbm"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'gdbm')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=gdbm" # cannot specify version for this download
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/gdbm.html")
md5sums=('79411548d37cbae0506d2d0303125b20' 'd8ae7db956a0176386b5214d01a6cb61')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "gdbm-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "gdbm-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "gdbm-$pkgver/$fname"
		else
			dd iflag=fullblock of="gdbm-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/gdbm-$pkgver"
	cp ../$pkgname-$pkgver.html gdbm.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/gdbm"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "gdbm.html" "$pkgdir/usr/share/doc/$pkgname/gdbm.html"
}
