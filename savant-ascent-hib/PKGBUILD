# Submitter: Yaohan Chen <yaohan.chen@gmail.com>
# Maintainer: Cristóvão Gomes Ferreira <crisoagf@gmail.com>

pkgname='savant-ascent-hib'
_appname='savant-ascent'
pkgdesc='A music shoot-em up game'
pkgver=20141127
license='custom: Commercial'
pkgrel=1
url='http://savantgame.com/'
arch=('i686' 'x86_64')
_desktopfile="${_appname}.desktop"
source=('hib://Savant-Ascent-Default-100.zip'
        "$_desktopfile")
md5sums=('fd144fcd2fb129f1d6c462ca6cd1d436'
         'f95038df8aa05c3a67abb9f07665b374')
depends=('libglapi')
if [ "$CARCH" = 'x86_64' ]; then
  depends=('lib32-libglapi')
fi

package() {
  _installdir="opt/$_appname"
  install -d "$pkgdir/$_installdir"

  cd "$srcdir/Savant-Ascent"

  _exec="$_installdir/$_appname"
  install -Dm755 runner "$pkgdir/$_exec"
  _bindir="$pkgdir/usr/bin"
  install -d "$_bindir"
  ln -s "/$_exec" "$_bindir/$_appname"

  install -Dm644 'assets/icon.png' "$pkgdir/usr/share/icons/${_appname}.png"

  install -Dm644 "$srcdir/$_desktopfile" "$pkgdir/usr/share/applications/$_desktopfile"

  mv assets "$pkgdir/$_installdir"
}
