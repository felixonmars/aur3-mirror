# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-glut
pkgver=1.17
pkgrel=4
pkgdesc="Chicken Scheme Egg: GLUT bindings"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/glut"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-silex' 'chicken-easyffi' 'freeglut')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=glut&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/glut.html")
md5sums=('e67b4bd1ac5d72b60092c694a9f56d25' '452bb5fb65ec65b603af962cbb0f4e10')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "glut-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "glut-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "glut-$pkgver/$fname"
		else
			dd iflag=fullblock of="glut-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/glut-$pkgver"
	cp ../$pkgname-$pkgver.html glut.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/glut"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "glut.html" "$pkgdir/usr/share/doc/$pkgname/glut.html"
}
