# Maintainer: Pablo Serrano <pablo [at] pabloserrano (dot) cc>

pkgname=pacmanager3
pkgver=3
pkgrel=1
pkgdesc="Perl/GTK Gnome replacement for SecureCRT/Putty"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/davidtv/"
license=("GPL-3")
source=("https://sourceforge.net/projects/pacmanager/files/pac-3.0/pac-${pkgver}-all.tar.gz")
depends=("perl-gtk2-ex-simple-list" "perl-gnome2-vte" "perl-expect" "perl-io-stty" "perl-yaml" "glade-perl" "gconf-perl" "perl-crypt-cbc" "perl-crypt-blowfish" "perl-net-arp" "perl-socket6" "perl-data-uuid")
md5sums=('cecdcdf2fd19f3384dfc0fb066c46d36')

build() {
  return 0
}

package() {
  cd $srcdir/pac
  mkdir -p $pkgdir/usr/{share/pacmanager/{lib/{ex,edit,method},res,utils},bin}
  install -D -m 644 lib/* $pkgdir/usr/share/pacmanager/lib || true
  install -D -m 755 lib/pac_conn $pkgdir/usr/share/pacmanager/lib/pac_conn
  install -D -m 644 lib/edit/* $pkgdir/usr/share/pacmanager/lib/edit/
  install -D -m 644 lib/method/* $pkgdir/usr/share/pacmanager/lib/method/
  install -D -m 644 lib/ex/* $pkgdir/usr/share/pacmanager/lib/ex/
  install -D -m 644 res/*png $pkgdir/usr/share/pacmanager/res
  install -D -m 644 res/*jpg $pkgdir/usr/share/pacmanager/res
  install -D -m 644 res/*glade $pkgdir/usr/share/pacmanager/res
  install -D -m 755 utils/pac_from_mcm.pl $pkgdir/usr/share/pacmanager/utils/pac_from_mcm.pl
  install -D -m 755 pac $pkgdir/usr/share/pacmanager/pac
  install -D -m 644 README $pkgdir/usr/share/pacmanager/README
  install -D -m 644 res/pac.1 $pkgdir/usr/share/man/man1/pac.1
  install -D -m 644 res/pac.yml $pkgdir/usr/share/pacmanager/res/pac.yml
  install -D -m 644 res/pac64x64.png ${pkgdir}/usr/share/pixmaps/pac.png && \
  install -D -m 644 res/pac.desktop ${pkgdir}/usr/share/applications/pac.desktop
  install -D -m 644 res/pac_start.desktop ${pkgdir}/usr/share/applications/pac_start.desktop
  ln -s /usr/share/pacmanager/pac ${pkgdir}/usr/bin/pac
}
