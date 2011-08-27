# Contributor: b4283 <damispirit[at]gmail[dot]com>
pkgname=zterm-dev
pkgver=0.5001
pkgrel=1
pkgdesc="zterm is a telnet client that's been commonly used as a bbs client."
arch=('i686' 'x86_64')
url='http://zhouer.org/ZTerm/'
license=('GPLv2')
depends=('java-runtime>=6')
install=
source=(http://zhouer.org/ZTerm/ZTerm-current.zip)
md5sums=('21ec2bf08daf613462d603c227fb70a5')

build() {
  cd $srcdir/ZTerm
  for filename in *; do
    n=`echo $filename | tr '[:upper:]' '[:lower:]'`
    mv $filename $n
  done
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/zterm"
  install -Dm 644 $srcdir/ZTerm/* "$pkgdir/usr/share/zterm"
  echo -e '#!/bin/bash\n\njava -jar /usr/share/zterm/zterm.jar&' > "$pkgdir/usr/bin/zterm"
  chmod +x "$pkgdir/usr/bin/zterm"
}

