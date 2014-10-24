# Maintainer: Marcel Huber <marcelhuberfoo at gmail dot com>
# Contributor: Anntoin Wilkinson <anntoin@gmail.com>

pkgname=punch-time-tracking
pkgver=1.4.1
pkgrel=1
pkgdesc="Command Line time tracking that integrates with todo.txt from Lifehacker"
arch=(any)
url="http://code.google.com/p/punch-time-tracking/"
license=('GPL3')
depends=('python2')
makedepends=(git)
optdepends=('todotxt: integration with tasks - fairly useless without this')
install=$pkgname.install
source=($pkgname::git+git://github.com/marcelhuberfoo/punch-time-tracking-plus.git#tag=$pkgver)
sha256sums=('SKIP')

prepare()
{
  cd $srcdir/$pkgname
  # Add #!/usr/bin/env python to the Start of the file
  sed -i '1i #!/usr/bin/env python2' Punch.py
}

package()
{
  install -D -m755 $srcdir/$pkgname/Punch.py $pkgdir/usr/bin/punch
}

# vim:set ts=2 sw=2 et:
