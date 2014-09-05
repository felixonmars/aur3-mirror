# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_v=16-Nov-2012
pkgname=boar
pkgver=0.2012.11.16
pkgrel=1
pkgdesc="Simple version control and backup for photos, videos and other binary files."
arch=('any')
url="http://code.google.com/p/boar/"
license=('GPL')
depends=('python2')
source=("http://boar.googlecode.com/files/$pkgname.$_v.tar.gz")
md5sums=('2a0cf0aea8f5ebe79e09312dc8752899')


package() {
  cd "$srcdir/$pkgname"

  # data
  install -d "$pkgdir"/usr/{bin,share/$pkgname}
  cp -a *[^bat] "$pkgdir/usr/share/$pkgname"

  # boar bin
  cat << EOF >> "$pkgdir/usr/bin/$pkgname"
#!/bin/bash
cd /usr/share/$pkgname && python2 $pkgname \$@
EOF

  # boarmount bin
  cat << EOF >> "$pkgdir/usr/bin/${pkgname}mount"
#!/bin/bash
cd /usr/share/$pkgname && python2 ${pkgname}mount \$@
EOF

  # exec mod
  chmod +x "$pkgdir/usr/bin/"*

  # python2 fixes
  sed -i "s|env python|&2|" \
    `grep -rl "env python" "$pkgdir"`
  sed -i "s|\(python\) |\12 |" \
    "$pkgdir/usr/share/$pkgname/run_tests.sh"

  # remove unneeded imports
  sed -i "38,42d" "$pkgdir/usr/share/$pkgname/workdir.py"
}

# vim:set ts=2 sw=2 et:
