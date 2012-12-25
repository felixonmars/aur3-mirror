pkgname=gnome-manpages
pkgver=20121225
pkgrel=1
pkgdesc="Section 3 manpages for various gnome related libraries"
url="https://github.com/chergert/gnome-manpages/"
arch=('any')
depends=('man-db')
license=('GPL2')
build_depends=('tar' 'gzip')
install='gnome-manpages.install'
full_hash='843aa4a2918bedadc3325403ed4c721767c3d44b'
short_hash=$(echo $full_hash|head -c7)
source=('https://github.com/chergert/gnome-manpages/zipball/'$short_hash)
md5sums=('e7570d6e7046e211996da3d92c151047')

package() {
    cd $srcdir/chergert-gnome-manpages-$short_hash/
    for ARCHIVE in *-manpages.tar.gz;
    do
        tar xzf $ARCHIVE;
    done
    mkdir -p $pkgdir/usr/share/man/man3/
    install -m0644 *.3 $pkgdir/usr/share/man/man3/
    # Compress manpages
    gzip -r $pkgdir/usr/share/man/man3/
}
