pkgname=wine-locale
pkgver=27
pkgrel=1
pkgdesc="Locale manager for Wine"
url="http://code.google.com/p/winelocale/"
arch=(any)
license=("BSD")
depends=("pygtk>=2.0" python2 python2-libgnome)
makedepends=(subversion)
source=("$pkgname.desktop")
md5sums=('2dd32e8fdc0748c11eeef9df365a4829')
_svntrunk="http://winelocale.googlecode.com/svn/trunk/"
_svnmod="winelocale"

build() {
  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg 'SVN checkout done or server timeout'

  rm -rf "${_svnmod}-build"
  cp -r "$_svnmod" "${_svnmod}-build"
  cd "${_svnmod}-build/current"
  
  sed -i "s:#!/usr/bin/python2.5:#!/usr/bin/python2:" winelocale.py
}

package() {
  cd "$srcdir/${_svnmod}-build"
  install -Dm755 "current/winelocale.py" "$pkgdir/usr/share/$pkgname/winelocale.py"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "winelocale.png" "$pkgdir/usr/share/icons/$pkgname.png"
  install -Dm644 "current/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "current/winelocale.svg" "$pkgdir/usr/share/$pkgname/winelocale.svg"
  cp -r "current/i18n" "$pkgdir/usr/share/$pkgname/"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/winelocale.py" "$pkgdir/usr/bin/winelocale"
}
