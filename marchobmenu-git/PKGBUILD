# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: David Spicer <azleifel at googlemail dot diddly dot dot com>

_pkgname=marchobmenu
pkgname=marchobmenu-git
pkgver=3.1.2.g6b1f4a3
pkgrel=1
pkgdesc="An adaptation for Openbox of Marchfluxmenu and mint-fm2"
arch=('any')
url="http://github.com/ju1ius/marchobmenu"
license=('GPL')
depends=('bash' 'inotify-tools' 'zenity')
makedepends=('git')
provides=('marchobmenu')
conflicts=('marchobmenu')
source=("git://github.com/ju1ius/marchobmenu.git"
        "marchobmenu.init.d.diff")
md5sums=('SKIP'
        '42a8971514b117b862cda20d8e59ee4b')


pkgver() {
  cd $_pkgname

  git describe --always --tags | sed -e 's|-|.|g'
}

prepare() {
  cd $_pkgname

  #patch -Np0 -i "$srcdir/marchobmenu.init.d.diff"
}

package() {
  cd "$srcdir/$_pkgname"

  #install -D -m755 "etc/init.d/marchobmenu" "$pkgdir/etc/rc.d/marchobmenu"
  #install -d -m755 "$pkgdir/usr/lib"
  #cp -Rp "usr/lib/marchobmenu" "$pkgdir/usr/lib"
  #install -D -m644 "README.md" "$pkgdir/usr/share/doc/marchobmenu/README"
  #cd "$pkgdir/etc/rc.d/"
  make prefix=$pkgdir/usr sysconfdir=$pkgdir/etc install
} 
