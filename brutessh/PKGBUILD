# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Francesco Piccinno <stack.box@gmail.com>

pkgname=brutessh
pkgver=0.6
pkgrel=4
pkgdesc="A simple multithreaded sshd password bruteforcer using a wordlist."
url="http://www.edge-security.com/edge-soft.php"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2' 'python2-paramiko')
source=(http://www.edge-security.com/soft/${pkgname}-${pkgver}.tar)
md5sums=('fb1bf149f5316cdad8307a6252b1f851')

package() {
  cd "$srcdir/$pkgname"

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/$pkgname
  sed -i 's/paramiko.util/\#paramiko.util/g' brutessh.py
  cp README brutessh.py terminal.py $pkgdir/usr/share/$pkgname/ || return 1
  cat > $pkgdir/usr/bin/$pkgname << EOF
#!/bin/sh
python2 /usr/share/brutessh/brutessh.py \$*
EOF
  chmod 0755 $pkgdir/usr/bin/$pkgname
  chmod 0755 $pkgdir/usr/share/$pkgname/$pkgname.py
}

# vim:set ts=2 sw=2 et:
