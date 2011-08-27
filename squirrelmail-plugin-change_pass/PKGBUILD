# Contributor: Piotr Beling <qwak@w8.pl>

pkgname=squirrelmail-plugin-change_pass
pkgver=2.7a
_squirrelver=1.4.x
pkgrel=1
pkgdesc="Plugin for squirrelmail. Lets you change your password using PAM or Courier authentication modules."
arch=(any)
url="http://www.squirrelmail.org/plugin_view.php?id=21"
depends=('squirrelmail')
license=('GPL')
source=(http://www.squirrelmail.org/countdl.php?fileurl=http%3A%2F%2Fwww.squirrelmail.org%2Fplugins%2Fchange_pass-${pkgver}-${_squirrelver}.tar.gz)

build() {
  # install
  local dstdir=$pkgdir/srv/http/squirrelmail/plugins		|| return 1
  install -d $dstdir						|| return 1
  cp -R $srcdir/change_pass $dstdir				|| return 1
}

md5sums=('c42b0c7090e6736b14371f12990b660d')
