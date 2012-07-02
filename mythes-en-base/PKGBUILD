# Contributer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='mythes-en-base'
pkgver=20060306
pkgrel=1
arch=('any')
url="http://wiki.services.openoffice.org/wiki/Dictionaries#English_.28AU.2CCA.2CGB.2CNZ.2CUS.2CZA.29"
license=('LGPL')
pkgdesc="English thesaurus (base files)"
optdepends=('libmythes: offers thesaurus library functions')
conflicts=('mythes-en')
# Fedora uses http://www.danielnaber.de/wn2ooo/ but it doesn't look more fresh
source=("http://vesta.informatik.rwth-aachen.de/ftp/pub/mirror/OpenOffice/contrib/dictionaries/thes_en_US_v2.zip")
md5sums=('ec611ad21ae4ee2b4415e27e252e4952')

build() {
  /bin/true
}

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/mythes
  install -m644 th_en_US_v2.* $pkgdir/usr/share/mythes

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/mythes/*; do
      ln -sv /usr/share/mythes/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_th_en_US_v2.txt $pkgdir/usr/share/doc/$pkgname
  
  # licences
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -m644 README_th_en_US_v2.txt $pkgdir/usr/share/licenses/$pkgname
}

