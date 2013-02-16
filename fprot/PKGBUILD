# Maintainer: bal <b.vajdics@gmail.com>
# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Peter Vogl <peter.vogl@squeaker-media.net>

pkgname=fprot
pkgver=6.2.3
pkgrel=2
pkgdesc="Frisk Software International's Antivirus for Linux Workstations"
arch=('i686' 'x86_64')
url="http://www.f-prot.com/products/home_use/linux/"
license=('custom')
depends=('glibc')
[[ $CARCH == x86_64 ]] && depends[0]='lib32-glibc'
backup=(etc/f-prot.conf)
install=fprot.install
source=(http://files.f-prot.com/files/unix-trial/fp-Linux.x86.32-ws.tar.gz
        fprot.cron fpupdate.sh fpscan.sh)
md5sums=('fca330070f62953caf1c52cb71d6203c'
         'cb3ba560a6f612d38a863f4d29c84441'
         '15fb0ce612539417bea998b67c11f000'
         '6f18902675de914fe5b93643a31c09a9')

build() {
  cd "$srcdir/f-prot"
  install -dm755 "$pkgdir"/usr/share/{fprot,doc/fprot/images}
  install -m755 fpscan fpupdate "$pkgdir/usr/share/fprot"
  install -m644 *.key *.def product.data.default "$pkgdir/usr/share/fprot"
  install -m644 README doc/html/Helpfiles_v6/*.* "$pkgdir/usr/share/doc/fprot"
  install -m644 doc/html/Helpfiles_v6/images/* "$pkgdir/usr/share/doc/fprot/images"

  install -Dm644 doc/man/*.1 "$pkgdir/usr/share/man/man1/fpscan.1"
  install -Dm644 doc/man/*.5 "$pkgdir/usr/share/man/man5/f-prot.conf.5"
  install -Dm644 doc/man/*.8 "$pkgdir/usr/share/man/man8/fpupdate.8"
  install -Dm644 doc/LICENSE-FPAV "$pkgdir/usr/share/licenses/fprot/LICENSE"
  install -Dm755 ../fprot.cron "$pkgdir/etc/cron.hourly/fpupdate"
  install -Dm755 ../fpupdate.sh "$pkgdir/usr/bin/fpupdate"
  install -Dm644 f-prot.conf.default "$pkgdir/etc/f-prot.conf"

  ln -sf /etc/f-prot.conf "$pkgdir/usr/share/fprot/f-prot.conf"
  ln -sf product.data.default "$pkgdir/usr/share/fprot/product.data"
  # If we symlink fpscan, it will look for the signatures file in /usr/bin.
  #ln -sf /usr/share/fprot/fpscan "$pkgdir/usr/bin"
  install -Dm755 ../fpscan.sh "$pkgdir/usr/bin/fpscan"
}
