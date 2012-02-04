# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=monster2
pkgver=1.1
pkgrel=2
pkgdesc="Monster RPG 2: 16-bit style JRPG (Commercial)"
arch=('i686' 'x86_64')
url="http://www.monster-rpg.com"
license=('custom:commercial')
depends=('libgl' 'libxinerama' 'libxfixes')
source=($pkgname.sh $pkgname.desktop)
md5sums=('9f71ab2894d17a801f5df1b3966e6895' 'ddcd1849ff80d2951ee97d9a5df030a4')

case ${CARCH} in
  i686)
    _gamepkg="MonsterRPG2-${pkgver}_32bit.tar.bz2"
    _gamemd5="bf674ee4b70385d9938e56d42da486e9";;

  x86_64)
    _gamepkg="MonsterRPG2-${pkgver}_64bit.tar.bz2"
    _gamemd5="dca28e304ecfea6dcf2d3c6ea8e9b70c";;
esac

build() {
  if [[ ! -f $startdir/$_gamepkg ]]; then
    msg "Monster RPG 2 is a commercial game."
    msg "You need your purchased copy of the game in order to install it."
    msg "Please copy $_gamepkg to $startdir and retry." && return 1
  else
    msg "Validating game package with md5sums..."
    if [[ "$(md5sum $startdir/$_gamepkg | awk '{print $1}')" == "$_gamemd5" ]]; then
      msg "$_gamepkg... Passed"
    else
      msg "$_gamepkg... FAILED" && return 1
    fi
  fi
  msg "Extracting game package..."
  tar xvjf $startdir/$_gamepkg -C $srcdir
}

package() {
  cd $srcdir/${_gamepkg//.tar.bz2/}
  install -D -m755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/share/{applications,licenses/$pkgname}
  cp -a ../$pkgname.desktop $pkgdir/usr/share/applications
  cp -a LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
  mkdir -p $pkgdir/opt/$pkgname
  cp -a data *.so $pkgname $pkgdir/opt/$pkgname/
}
