pkgname=imagej-plugin-image-correlator
pkgver=20031121
pkgrel=1
pkgdesc="ImageJ plugins by Wayne Rasband"
arch=(any)
url=http://rsbweb.nih.gov/ij/plugins/image_correlator.html
license=(unknown)
depends=(imagej)
source=(
    "http://rsbweb.nih.gov/ij/plugins/download/Image_Correlator.class"
)
for ((i=0;i<${#source[*]};i++)); do noextract[$i]="`basename "${source[i]}"`"; done

build() {
    for i in "${noextract[@]}"; do
      	install -D -m 644 "$srcdir"/"$i" "$pkgdir"/usr/share/imagej/plugins/"$i"
    done
}
md5sums=('7ef13f97e2c7c4f458b2cd9d39a2e665')
