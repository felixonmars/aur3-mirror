# $Id$

pkgname=hunspell_yo-ru
pkgver=0.1
pkgrel=1
pkgdesc="Russian hunspell dictionary"
provides=('hunspell-ru')
conflicts=('hunspell-ru')
arch=(any)
#url="http://extensions.services.openoffice.org/project/dict_ru_RU_yo"
url="http://extensions.services.openoffice.org/en/project/russian-dictionary-%D1%91"
license=('custom')
optdepends=('hunspell: the spell checking libraries and apps')
#source=(http://extensions.services.openoffice.org/e-files/2558/0/dict_ru_RU_yo-0.1.oxt)
source=("http://downloads.sourceforge.net/project/aoo-extensions/2558/0/dict_ru_ru_yo-${pkgver}.oxt")
md5sums=('fbd89265ac10176c452bf342fa1c6672')

package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m 644 ru_RU_yo.dic ru_RU_yo.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  install -m 644 README $pkgdir/usr/share/doc/$pkgname
  install -m 644 LICENSE $pkgdir/usr/share/doc/$pkgname
}

