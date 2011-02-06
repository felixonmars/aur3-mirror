# Maintainer: Robert Ransom <rransom.8774@gmail.com>
pkgname=md5coll
pkgver=0.1
pkgrel=2
pkgdesc="Generate MD5 collisions"
arch=(i686 x86_64)
url="http://www.stachliu.com/index.php/resources/tools/"
license=('unknown')
depends=(glibc)
source=("http://mirror.roe.ch/dist/$pkgname/$pkgver/$pkgname.c")
noextract=($pkgname.c)

#md5sums=('1c5d6641d6d07d8a7b510d44d5b4da04')
sha1sums=('fdef49debfdc07a2c2bccac33d4164ad57d7b341')
sha256sums=('ce00158446d946f0333baec9f38470f3670d46c1086d3d71b28ddee5313c5542')
sha384sums=('a6551eb568c470258697293438573deb73b3a9a5e3426a5a9eba0e185ef8cdfd2c8aa3e243255e8eee588c007b336339')
sha512sums=('7329550fadd9e6bf453fbb6cb407c61097b088022a5287ea11868eda182510cd4b704750de559439d8444bdf70b7c12f36d7909f633868ca890aa257dbe25bea')

# This PKGBUILD is based on /usr/ports/security/md5coll/* from the
# FreeBSD ports collection.

# The original web site for this tool seems to have disappeared; the
# source URL above points to a mirror set up by the FreeBSD port
# maintainer (daniel@roe.ch).

build() {
  cd "$srcdir" || return 1

  cc -o $pkgname $pkgname.c || return 1
}

package() {
  cd "$srcdir" || return 1

  install -d "$pkgdir/usr/bin" || return 1
  install $pkgname "$pkgdir/usr/bin/$pkgname" || return 1
}
