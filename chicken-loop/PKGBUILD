# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-loop
pkgver=1.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: The Common Lisp LOOP macro"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/loop"
license=('GPL')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=loop&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/loop.html")
md5sums=('f266ef355a9a683b0fec0e15e54bb606' '1c2c2ff0caa01c59e53c0c7feb17bb18')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "loop-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "loop-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "loop-$pkgver/$fname"
		else
			dd iflag=fullblock of="loop-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/loop-$pkgver"
	cp ../$pkgname-$pkgver.html loop.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/loop"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "loop.html" "$pkgdir/usr/share/doc/$pkgname/loop.html"
}
