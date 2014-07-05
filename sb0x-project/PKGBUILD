#Maintainer: levi0x0

pkgname='sb0x-project'
pkgver=20140627
pkgrel=1
pkgdesc='A simple and Lightweight framework for Penetration testing.'
url='https://github.com/levi0x0/sb0x-project'
arch=('any')
license=('GPL3')
depends=('python2')
makedepends=('git')
source=('git+https://github.com/levi0x0/sb0x-project.git')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/sb0x-project"
	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  cd "$srcdir/sb0x-project"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/sb0x"

  install -Dm644 README.md "$pkgdir/usr/share/doc/sb0x/README.md"
  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/sb0x/LICENSE"

  cp -a doc/* "$pkgdir/usr/share/doc/sb0x"
  cp -a * "$pkgdir/usr/share/sb0x/"

  cat > "$pkgdir/usr/bin/sb0x" << EOF
#!/bin/sh
cd /usr/share/sb0x
exec python2 sb0x.py "\$@"
EOF

  #the premissions is for sb0x can read/write config files
  chown $USER -R "$pkgdir/usr/share/sb0x/"
  chmod 775 "$pkgdir/usr/share/sb0x/"
  chmod +x "$pkgdir/usr/bin/sb0x"
}
