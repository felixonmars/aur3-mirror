# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-autocompile
pkgver=0.6
pkgrel=4
pkgdesc="Chicken Scheme Egg: Automatically compile Scheme scripts on demand"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/autocompile"
license=('public')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=autocompile&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/autocompile.html")
md5sums=('49ec8be313b5063038d76801ccc8674f' '234bf458554aa026859766fce935628c')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "autocompile-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "autocompile-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "autocompile-$pkgver/$fname"
		else
			dd iflag=fullblock of="autocompile-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/autocompile-$pkgver"
	cp ../$pkgname-$pkgver.html autocompile.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/autocompile"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "autocompile.html" "$pkgdir/usr/share/doc/$pkgname/autocompile.html"
}
