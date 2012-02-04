# Maintainer: Robert Ransom <rransom.8774@gmail.com>
pkgname=md4coll
pkgver=0.1
pkgrel=3
pkgdesc="Generate MD4 collisions"
arch=(i686 x86_64)
url="http://www.stachliu.com/index.php/resources/tools/"
license=('unknown')
depends=(glibc)
source=("http://mirror.roe.ch/dist/$pkgname/$pkgver/$pkgname.c")
noextract=($pkgname.c)

#md5sums=('afae19b001a95b469fd9897dcf208661')
sha1sums=('eb74f3405ca53462711d09c8a8191f5fcf628e1b')
sha256sums=('2bebad65909745571594f17a961b74232c8dfde3ae0949d01246d67c9c0e48a3')
sha384sums=('f94cec7c36bbff5f001416855dedc64d94bb429b6d77c1887e612d3072c830d9d07d8b2db90ab15041627aa9fe75d7a5')
sha512sums=('b2d10a9c4405ff9c9a6a6d6e651a3d1c3754c77a1f411704c3ca1681a17794318dcf36a4116e5d2ee9ff29492f341153912fcb16e8c7ac1c1fe9d690f49502fb')

# This PKGBUILD is based on /usr/ports/security/md4coll/* from the
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
