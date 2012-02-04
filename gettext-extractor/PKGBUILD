# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=gettext-extractor
pkgver=1.0
pkgrel=3
pkgdesc="Extracts gettext phrases from PHP files and Nette Framework templates"
url="http://charlie.cz/gettext-extractor/"
arch=('i686' 'x86_64')
license=('custom')
install=
source=()
depends=('php')
makedepends=('git')

#_gitroot="git://github.com/Edke/${pkgname}.git"
_gitroot="git://github.com/seberm/gettext-extractor.git"


build() {

  cd ${srcdir}
  msg "Connecting to GIT ($_gitroot) ..."

  if [ -d $pkgname ]; then

    cd $pkgname && git pull origin
    msg "The local files of ${pkgname} updated."
  else
    git clone $_gitroot $pkgname
  fi
  
  msg "GIT checkout done or server timeout"

  install -d $pkgdir/usr/share/pear/$pkgname/{Filters,Nette}

  install -Dm755 "${srcdir}/${pkgname}/Filters/"* "${pkgdir}/usr/share/pear/${pkgname}/Filters"
  install -Dm755 "${srcdir}/${pkgname}/Nette/"* "${pkgdir}/usr/share/pear/${pkgname}/Nette"

  install -m755 "${srcdir}/${pkgname}/gettext-extractor.php" "${pkgdir}/usr/share/pear/${pkgname}"
  install -m755 "${srcdir}/${pkgname}/GettextExtractor.php" "${pkgdir}/usr/share/pear/${pkgname}"
  install -m755 "${srcdir}/${pkgname}/NetteGettextExtractor.php" "${pkgdir}/usr/share/pear/${pkgname}"

  install -d $pkgdir/usr/sbin
  mkdir -p $pkgdir/usr/share/pear/$pkgname
  ln -s /usr/share/pear/$pkgname/gettext-extractor.php $pkgdir/usr/sbin/$pkgname
}

