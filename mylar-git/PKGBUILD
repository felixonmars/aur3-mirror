# Maintainer:  Shaun Hammill <plloi.pllex@gmail.com>
# Contributor: Melon_Bread 7-31-14
# Contributor: Crass00 <crass00 at hotmail dot com>
 
pkgname=mylar-git
pkgver=421.e64b50a
pkgrel=1
pkgdesc="An automated Comic Book (cbr/cbz) downloader"
arch=(any)
url="https://github.com/evilhero/mylar"
license=(GPL3)
depends=(python2 python2-cheetah)
makedepends=(git)
optdepends=('sabnzbd: NZB downloader')
install=mylar.install
backup=('etc/conf.d/mylar')
conflicts=(mylar)
source=("$pkgname::git://github.com/evilhero/mylar.git"
        'mylar-system.service' 'mylar-user.service' 'mylar.tmpfile')
md5sums=('SKIP'
         '622dbdedab0737785f614faa6939f2a8'
         '3c12fdda3a34ae8927ab31785f57ffb6'
         'b6d33b931e1dd7099f5ddab3a1ee8c13')
 
pkgver() {
  cd "$srcdir"/$pkgname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
 
 
package() {
  mkdir -p "$pkgdir"/opt/mylar
  mkdir -p "$pkgdir"/opt/mylar/cache
  cp -r "$srcdir"/$pkgname/* "$pkgdir"/opt/mylar
  chmod 775 "$pkgdir/opt/mylar"
 
  sed -i 's/python/python2/g' "$pkgdir"/opt/mylar/post-processing/sabnzbd/ComicRN.py
  sed -i 's/python/python2/g' "$pkgdir"/opt/mylar/post-processing/autoProcessComics.py
 
  install -D -m644 "$srcdir"/mylar-system.service "$pkgdir"/usr/lib/systemd/system/mylar.service
  install -D -m644 "$srcdir"/mylar-user.service "$pkgdir"/usr/lib/systemd/user/mylar.service
  install -D -m644 "$srcdir"/mylar.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/mylar.conf
 
  find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}
