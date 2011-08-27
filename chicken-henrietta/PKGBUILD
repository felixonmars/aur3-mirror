# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-henrietta
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Serve extensions over HTTP"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/henrietta"
license=('BSD')
depends=('chicken>=4.5.8'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=henrietta&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/henrietta.html")
md5sums=('69ca5c03587632ab28f21672e0f15625' '9a08ba6e79902ec16cc586a7657ef208')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "henrietta-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "henrietta-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "henrietta-$pkgver/$fname"
		else
			dd iflag=fullblock of="henrietta-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/henrietta-$pkgver"
	cp ../$pkgname-$pkgver.html henrietta.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/henrietta"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "henrietta.html" "$pkgdir/usr/share/doc/$pkgname/henrietta.html"
}
