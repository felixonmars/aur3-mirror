# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-lognum
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Logarithmic number system."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/lognum"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-datatype' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=lognum&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/lognum.html")
md5sums=('b71763845363b78346873a035386accf' 'b1a12ba8bc84173623920e43a39e86e1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "lognum-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "lognum-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "lognum-$pkgver/$fname"
		else
			dd iflag=fullblock of="lognum-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/lognum-$pkgver"
	cp ../$pkgname-$pkgver.html lognum.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/lognum"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "lognum.html" "$pkgdir/usr/share/doc/$pkgname/lognum.html"
}
