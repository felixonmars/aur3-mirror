pkgname="loopboot"
pkgver="0.0.1"
pkgrel="0"
pkgdesc="Let arch boot from a loop file like ubuntu wubi!"
arch="any"
url="http://http://code.google.com/p/loopboot"
license=('GPL2')
depends=('jfsutils'
	 'xfsprogs'
	 'e2fsprogs'
	 'ntfs-3g'
	 'fuse'
	 'mkinitcpio')
optdepends=('aufs: Multiloop boot support.')
conflicts=('save2loop')
options=('!strip')
install='fa.install'
source=('http://loopboot.googlecode.com/files/lib.tar.xz'
	'fa.install')
sha1sums=('2807cb2eaa151e1f5fdacb2786b01b2c93457f27'
	  '7c1191f244a147f26178417371432fce126b2bab')
package()
{
	echo -n -e "\E[1;32m""Packing...\033[0m"
	cd $srcdir
	cp -r lib $pkgdir
	echo -e "\E[1;32m""		[ Done ]\033[0m"
}