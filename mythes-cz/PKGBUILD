# Maintainer: Your Name <fraantik (zavinac) centrum.cz>
pkgname=mythes-cz
pkgver=20070926
pkgrel=1
pkgdesc="Czech thesaurus"
arch=(any)
url="https://wiki.archlinux.org/index.php/LibreOffice#Language_Aids"
license=('bsd-like')
optdepends=('libmythes: offers thesaurus library functions')
source=('http://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/myspell-thes_cs_CZ_v2-20070926.zip')
md5sums=('7f9c85b104db4cc6a719b3aab8c69a10') #generate with 'makepkg -g'

build() {
/bin/true
}

package() {
cd "$srcdir"
install -dm755 ${pkgdir}/usr/share/mythes
# cp -p thes_cs_CZ_v2.* $pkgdir/usr/share/mythes
install -m 644 th_cs_CZ_v2.* $pkgdir/usr/share/mythes

# the symlinks
install -dm755 ${pkgdir}/usr/share/myspell/dicts
pushd $pkgdir/usr/share/myspell/dicts
for file in $pkgdir/usr/share/mythes/*; do
ln -sv /usr/share/mythes/$(basename $file) .
done
popd

# docs
install -dm755 ${pkgdir}/usr/share/doc/$pkgname
# install -m 644 README_thes_cs_CZ.txt $pkgdir/usr/share/doc/$pkgname
install -m 644 th_cs_CZ_license.txt $pkgdir/usr/share/doc/$pkgname

}