# Maintainer: Vinh Nguyen <kurei [at] axcoto.com>
pkgname=gogs-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language"
arch=('i686' 'x86_64')
url="http://gogs.io/"
license=('free')
depends=(mysql)
makedepends=()
checkdepends=()
optdepends=(redis memcache)
backup=()
install=gogs.install

_homedir='/var/lib/gogs'
_datadir='/usr/share/gogs'
ipkgname=gogs

#source=("$pkgname"-"$pkgver"-"linux.tar.gz"
source=("http://gogs.qiniudn.com/${ipkgname}_v${pkgver}_linux_amd64.zip"
"http://gobuild.io/github.com/gogits/${ipkgname}/v${pkgver}/linux/386"
"gogs.service"
"gogs.conf"
"gogs.install")
noextract=("386")

md5sums=('4a0842b0ecf1b1cf462d7e1a260718ef'
         'f593130ad682715ade0f44ba2386bb84'
         '4bd192894425954a70c0a0ed94dbb8ab'
         'c9b9670dc9eb19130419628ae10e1e8d'
         '7dc9475f9c25b036cf07d81c84ee1efd')
build() {
  cd "$srcdir/$ipkgname_v$pkgver_linux_amd64"
}

package() {
  mkdir -p $pkgdir/var/lib/gogs/ \
            $pkgdir/usr/lib/systemd/system/ \
            $pkgdir/etc/ \
            $pkgdir/usr/share/gogs/ \
            $pkgdir/usr/share/gogs/db;
  if test "$CARCH" == x86_64; then
    cd "$srcdir/"
    pwd
    #bsdtar -xf $ipkgname_v$pkgver_linux_amd64.zip
    echo "Detec: X86_64. Use: ${ipkgname}_v${pkgver}_linux_amd64.zip"
    bsdtar -xf "${ipkgname}_v${pkgver}_linux_amd64.zip"
    cp -rf gogs/* "${pkgdir}/var/lib/gogs/"
  else 
    cd "$srcdir/"
    bsdtar -xf 386
    cp -rf LICENSE README.md README_ZH.md conf gogs public start.bat start.sh templates
  fi

  install -d -Dv gogs "${pkgdir}/var/lib/gogs/"
  install -v -Dm644 ../gogs.service $pkgdir/usr/lib/systemd/system/gogs-bin.service
  install -v -Dm644 ../gogs.conf $pkgdir/etc/
}
