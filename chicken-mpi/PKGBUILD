# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mpi
pkgver=1.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: Message-passing Interface (MPI)"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mpi"
license=('GPL3')
depends=('chicken>=4.5.0'  'openmpi')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mpi&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/mpi.html")
md5sums=('35d6fe67f792de0742a79203238d9c45' 'd81fa76cf70337f99055e42dabe259f0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "mpi-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "mpi-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "mpi-$pkgver/$fname"
		else
			dd iflag=fullblock of="mpi-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/mpi-$pkgver"
	cp ../$pkgname-$pkgver.html mpi.html
		sed -r -i'' -e 's!"-lmpi"!"-lmpi -L/usr/lib/openmpi"!' mpi.setup

	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/mpi"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "mpi.html" "$pkgdir/usr/share/doc/$pkgname/mpi.html"
}
