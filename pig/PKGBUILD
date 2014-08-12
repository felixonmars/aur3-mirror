# Contributor: Chun Yang <x@cyang.info>
pkgname=pig
pkgver=0.13.0
pkgrel=1
pkgdesc="High-level platform for creating MapReduce programs used with Hadoop"
arch=('any')
url="http://pig.apache.org"
license=('APACHE')
depends=('java-environment>=6' 'bash')
optdepends=(
'hadoop: cluster support'
)
backup=(
etc/profile.d/pig.sh
etc/pig/log4j.properties.template
etc/pig/pig.properties
)
source=(
"http://mirrors.gigenet.com/apache/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
"pig.profile"
"pig.sh"
)
sha256sums=('f4f6777165fcfc0d9df0a7ee4e897e0bdf73c8e8ec7fcc31db15c1917f5ca971'
            'b6321cb6c7506f50e64cd2cb30a218c56d275e4708a8e6203778b0f26c80ab17'
            'e4064b7d0bcd4286a885fa92ee2b7792a543946aac24b0fd854cf2ace6395a11')

package() {
  # move files
  install -dm755 "$pkgdir/usr/share/java/$pkgname-$pkgver/"{,lib,bin}
  cp -aR "$srcdir/$pkgname-$pkgver/bin"/* \
    "$pkgdir/usr/share/java/$pkgname-$pkgver/bin"
  cp -aR "$srcdir/$pkgname-$pkgver/lib"/* \
    "$pkgdir/usr/share/java/$pkgname-$pkgver/lib"
  cp -aR "$srcdir/$pkgname-$pkgver"/pig-*.jar \
    "$pkgdir/usr/share/java/$pkgname-$pkgver"

  install -dm755 "$pkgdir/etc/$pkgname"
  cp -aR "$srcdir/$pkgname-$pkgver/conf"/* "$pkgdir/etc/$pkgname"

  install -D -m 755 "$srcdir/pig.profile" "$pkgdir/etc/profile.d/pig.sh"
  install -D -m 755 "$srcdir/pig.sh" "$pkgdir/usr/bin/pig"

  # add symlinks
  cd "$pkgdir/usr/share/java"
  ln -sv "/usr/share/java/$pkgname-$pkgver" "$pkgname"
}

# vim:set ts=2 sw=2 et:
