# Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=mic
pkgver=0.24.4
pkgrel=1
pkgdesc="Image Creator for Linux Distribution"
arch=(any)
url="https://download.tizen.org/tools/latest-release"
license=('GPL2')
depends=('python2' 'urlgrabber' 'yum' 'python2-lxml' 'cpio' 'bzip2' 'gzip' \
        'util-linux' 'psmisc' 'e2fsprogs' 'dosfstools>=2.11' 'device-mapper' \
        'syslinux' 'squashfs-tools' 'cdrkit' 'multipath-tools' 'mtools' 'parted')
makedepends=('git' 'python2-docutils')
optdepends=('python2-zypp: package manager plugin of mic')
source=(git+git://git.tizen.org/tools/mic)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git describe --always | sed -r 's/-/./g')
}

build() {
  cd "$srcdir/$pkgname"

  python2 setup.py build
  sed -i 's/rst2man/rst2man2/' Makefile
  make man
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  install -d -m755 "$pkgdir/usr/share/man/man1"
  install -m644 doc/mic.1 "$pkgdir/usr/share/man/man1"
  install -d -m755 "$pkgdir/etc/bash_completion.d"
  install -m755 etc/bash_completion.d/$pkgname.sh "$pkgdir/etc/bash_completion.d"
  install -d -m755 "$pkgdir/etc/zsh_completion.d"
  install -m755 etc/zsh_completion.d/_$pkgname "$pkgdir/etc/zsh_completion.d"
  cp -p $pkgdir/usr/bin/mic $pkgdir/usr/bin/mic-native
}

