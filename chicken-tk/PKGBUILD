# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-tk
pkgver=1.9
pkgrel=4
pkgdesc="Chicken Scheme Egg: An interface to the Tk GUI toolkit"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tk"
license=('custom:Bremer License')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=tk&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/tk.html")
md5sums=('d0c6c780c2ed7e04a44408f5967a3250' 'a6ca7f15016907f6ecd64d98d3d60192')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "tk-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "tk-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "tk-$pkgver/$fname"
		else
			dd iflag=fullblock of="tk-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/tk-$pkgver"
	cp ../$pkgname-$pkgver.html tk.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/tk"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "tk.html" "$pkgdir/usr/share/doc/$pkgname/tk.html"
}
