# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-glpk
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to the GNU Linear Programming Kit."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/glpk"
license=('GPL3')
depends=('chicken>=4.5.0'  'glpk')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=glpk&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/glpk.html")
md5sums=('4dca609ea89ae11899ba235ee663880d' '59039a26c4d8401f4bad1b9a484d3586')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "glpk-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "glpk-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "glpk-$pkgver/$fname"
		else
			dd iflag=fullblock of="glpk-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/glpk-$pkgver"
	cp ../$pkgname-$pkgver.html glpk.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/glpk"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "glpk.html" "$pkgdir/usr/share/doc/$pkgname/glpk.html"
}
