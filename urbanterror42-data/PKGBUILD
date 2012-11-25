# Maintainer: Josh Klar <j@iv597.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=urbanterror42-data
pkgver=4.2.006
pkgrel=1
pkgdesc="A team-based tactical shooter based on the Quake 3 Engine (data files)"
arch=('any')
url="http://www.urbanterror.net"
license=('custom')
source=('http://cdn.urbanterror.info/urt/42/zips/UrbanTerror42_full_006.zip')
md5sums=('65779cfa564345e7603a7a1aa61b54ea')
provides=('urbanterror-data')

build() {
	cd $srcdir
}

package() {
	install -d $pkgdir/opt/urbanterror/q3ut4/demos
	
	cd $pkgdir/opt/urbanterror

	for i in $srcdir/UrbanTerror42/q3ut4/*.{cfg,pk3,txt}; do
	    mv "$i" q3ut4/
	    chmod 644 "q3ut4/$(basename "$i")"
	done

  install -Dm644 $srcdir/UrbanTerror42/readme42.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  #echo -e "\nseta cl_cURLLib \"/usr/lib/libcurl.so.4\"" >> $pkgdir/opt/urbanterror/q3ut4/autoexec.cfg
}

# vim: sw=2:ts=2 et:
