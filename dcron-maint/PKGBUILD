_basepkgname=dcron
pkgname=${_basepkgname}-maint
pkgver=4.4
pkgrel=1
pkgdesc="dillon's lightweight cron daemon, with maintenance patches"
arch=(i686 x86_64)
license=('GPL')
url="http://www.jimpryor.net/linux/dcron"
backup=(var/spool/cron/root etc/conf.d/crond)
depends=('glibc')
provides=('cron')
conflicts=('dcron')
source=("http://www.jimpryor.net/linux/releases/${_basepkgname}-${pkgver}.tar.gz"
        'dcron-logname.patch'
        'dcron.rc.d'
        'dcron.conf.d'
        '0001-Fixing-bug-that-causes-monthly-jobs-to-be-skipped.patch'
        '0002-Only-resynchronize-if-there-are-no-running-jobs-to-a.patch')
md5sums=('02d848ba043a9df5bf2102a9f4bc04bd'
         'c6054421b48100f7a2a7a36e2d33c92a'
         '73693cdd59df526e729cdec99c5ed8fb'
         '5bfa07beb54d0beaf3f38225e4d5a9fa'
         'd877903363dfcb174d0fa4630344bea8'
         'f0dfa5f38c386cd97143878cb63d7e8e')
optdepends=('smtp-server: sending cron job output via email')
install=$_basepkgname.install

build() {
  cd "$srcdir/${_basepkgname}-${pkgver}"

  for patch in $srcdir/*.patch; do
    msg2 "Patch: $(basename $patch)"
    patch -p1 -i $patch
  done

  # by default, any member of group "users" can edit their own crontab
  make PREFIX=/usr \
       CRONTAB_GROUP=users \
       CRONTABS=/var/spool/cron \
       CRONSTAMPS=/var/spool/cronstamps
  make DESTDIR="$pkgdir" install

  # install standard configuration and scripts
  install -d -m755 "$pkgdir/etc/cron."{hourly,daily,weekly,monthly}
  install -D -m755 extra/run-cron "$pkgdir/usr/sbin/run-cron"
  install -D -m0600 extra/root.crontab "$pkgdir/var/spool/cron/root"

  # install Arch configuration and launch scripts
  install -D -m755 "$srcdir/dcron.rc.d" "$pkgdir/etc/rc.d/crond"
  install -D -m0644 "$srcdir/dcron.conf.d" "$pkgdir/etc/conf.d/crond"
}
