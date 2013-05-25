# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=innounp
pkgver=0.38
pkgrel=1
pkgdesc="Inno Setup Unpacker"
arch=(i686 x86_64)
url="http://"$pkgname".sourceforge.net/"
license=('GPL')
depends=(wine)
makedepends=(unrar)
source=($pkgname http://downloads.sourceforge.net/sourceforge/$pkgname/"$pkgname"${pkgver/./}.rar)
md5sums=('a08756ad82fb51b88ab0fff7f7497ab5' 'e6ae772d006fa50ea1060b8638f201dc')
sha1sums=('8ce754017e315d6a535d588797b0fabcb6a7ed5f' '0c94ae892c24ad21abbfcdee012e202ebacf27a1')
noextract=("$pkgname"${pkgver/./}.rar)
options=(!strip)

build() {
  cd "$startdir"/src
  unrar x -inul -y "$pkgname"${pkgver/./}.rar
  }

package() {
  cd "$startdir"

  install -d -m755 $pkgdir/usr/share/$pkgname
  cp -ra src/"$pkgname".* $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

  install -d -m755 $pkgdir/usr/bin
  install -m755 $pkgname $pkgdir/usr/bin
  }
