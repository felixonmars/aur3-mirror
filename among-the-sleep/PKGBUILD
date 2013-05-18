# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=among-the-sleep
pkgver=alpha
pkgrel=1
pkgdesc="First person horror adventure in which you play a two year old child. You wake up in your crib at night, and scary things start to happen. You soon realize you need to find some safety."
arch=(i686 x86_64)
url=http://www.krillbite.com/ats/
license=(custom)
provides=($pkgname)
source=(https://s3-us-west-2.amazonaws.com/amongthesleep/PublicAlpha/LINUX/Among+The+Sleep+public+alpha+Linux.zip)
md5sums=(1987d794c4cf562a1ee6b890c96a8ed2)

package(){
  # Copy data
  mkdir -p $pkgdir/opt/$pkgname/
  cp -dr --preserve=mode,timestamp "$srcdir/Among The Sleep_Data/" $pkgdir/opt/$pkgname/

  # Copy correct binary
  [ "$CARCH" == 'x86_64' ] && _64=_64
  install "$srcdir/Among The Sleep.x86$_64" $pkgdir/opt/$pkgname/

  # Add link
  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/$pkgname/Among The Sleep.x86$_64" $pkgdir/usr/bin/$pkgname
}
