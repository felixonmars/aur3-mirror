# Maintainer: cyrilccros <cyril-cros@hotmail.fr> 

# Simple PKGBUILD which tracks the needed Perl dependencies (lots of them...).
# It installs in /usr/share/circos - I don't know if splitting up the circos package is possible...
# The tutorials and tools will be included later on I think, or as separate packages.

pkgname=circos
pkgver=0.67.7
_badPkgver=0.67-7 # This is the 'real' package version. $pkgver should not contain hyphens.
pkgrel=1
pkgdesc='Creates circular charts (NDLR; usually used in genomics).'
arch=('any')
url="http://www.circos.ca"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.8.0' 'perl-clone' 'perl-config-general' 'perl-data-dumper' 'perl-digest-md5-file' 'perl-font-ttf' 'perl-gd' 'perl-math-bezier' \
'perl-math-vecstat' 'perl-params-validate' 'perl-pod-coverage' 'perl-readonly' 'perl-regexp-common' 'perl-svg' 'perl-set-intspan' 'perl-statistics-basic' 'perl-text-format' \
'perl-math-round')
source=("http://www.circos.ca/distribution/circos-$_badPkgver.tgz")
md5sums=('cf063cdbb5d2e8988efd215bb85fa061')

package(){
# I am not bothering with putting everything in the correct place. All goes to /usr/share/circos, and I symlink the circos/bin
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/{$pkgname,doc/$pkgname}
mkdir -p $pkgdir/usr/lib
mkdir -p $pkgdir/etc
cp -r $pkgname-$_badPkgver/* $pkgdir/usr/share/$pkgname
ln -s $pkgdir/usr/share/circos/bin/circos $pkgdir/usr/bin/circos
ln -s $pkgdir/usr/share/circos/bin/gddiag $pkgdir/usr/bin/gddiag
ln -s $pkgdir/usr/share/circos/etc $pkgdir/etc/circos 
ln -s $pkgdir/usr/share/circos/lib $pkgdir/usr/lib/circos
}

check(){
cd "$pkgname-$_badPkgver/bin"
echo
echo "Testing if all the Perl dependencies are satisfied"
./circos -modules
echo
echo "You can display a graph to test the installation:"
echo "Use the command 'gddiag', you get a gddiag.png file"
echo "Compare the results with http://www.circos.ca/documentation/tutorials/configuration/png_output/images"
echo
}

