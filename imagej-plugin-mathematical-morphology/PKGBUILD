pkgname=imagej-plugin-mathematical-morphology
pkgver=20110109
pkgrel=1
pkgdesc="ImageJ plugins by Dimiter Prodanov"
arch=(any)
url=http://www.diagnosticarea.com/plugins/
license=(unknown)
depends=(imagej)
source=(
    "http://rsb.info.nih.gov/ij/plugins/download/Granulometry_.class"
    "http://www.diagnosticarea.com/plugins/GrayMorphology_.jar"
    "http://www.diagnosticarea.com/plugins/GranFilter_.jar"
)
for ((i=0;i<${#source[*]};i++)); do noextract[$i]="`basename "${source[i]}"`"; done

build() {
    for i in "${noextract[@]}"; do
      	install -D -m 644 "$srcdir"/"$i" "$pkgdir"/usr/share/imagej/plugins/"$i"
    done
}
md5sums=('520c1ab8f1baf3a861d5347431a462bf'
         'c7396453537f98f25706b005d9b10c62'
         '9b7bd50e5d43f0e69ce0258314ddc568')
