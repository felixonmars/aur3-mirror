# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-octave
pkgver=0.4
pkgrel=4
pkgdesc="Chicken Scheme Egg: Interface to GNU/Octave"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/octave"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=octave&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/octave.html")
md5sums=('58b5f263f4dcd959677101e8573ad5ff' 'cdddb5efd37384149173b768136e0727')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "octave-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "octave-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "octave-$pkgver/$fname"
		else
			dd iflag=fullblock of="octave-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/octave-$pkgver"
	cp ../$pkgname-$pkgver.html octave.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/octave"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "octave.html" "$pkgdir/usr/share/doc/$pkgname/octave.html"
}
