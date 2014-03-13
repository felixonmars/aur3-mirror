# Maintainer: Marcel Huber <`echo "moc tknup liamg tä oofrebuhlecram" | rev`>
# Contributor: Milan Knížek <knizek@volny.cz>

pkgname=zfs-auto-snapshot-git
pkgver=1.0.8.r7.g39bce83
pkgrel=2
pkgdesc="An alternative implementation of the zfs-auto-snapshot service for Linux that is compatible with zfs-linux and zfs-fuse."
arch=(i686 x86_64)
makedepends=('git')
url="https://github.com/zfsonlinux/zfs-auto-snapshot"
license=('GPL')
source=("$pkgname"::'git+https://github.com/zfsonlinux/zfs-auto-snapshot')
backup=('etc/cron.d/zfs-auto-snapshot'
        'etc/cron.daily/zfs-auto-snapshot'
        'etc/cron.hourly/zfs-auto-snapshot'
        'etc/cron.monthly/zfs-auto-snapshot'
        'etc/cron.weekly/zfs-auto-snapshot')
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    local _revs_ahead_tag=$(git rev-list --count ${GITTAG}..)
    local _commit_id_short=$(git log -1 --format=%h)
    echo $(sed -e s/^${pkgname%%-git}// -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r${_revs_ahead_tag}.g${_commit_id_short}
  else
    echo 0.$(git rev-list --count master).g$(git log -1 --format=%h)
  fi
}

build() {
  msg 'Starting make...'
  cd "$srcdir/$pkgname"
  sed -i -e 's@/sbin@/usr/bin@' \
         -e 's@$(PREFIX)/share@/usr/share@' \
         -e 's@install etc/\(.*\)\(frequent\)@install -m644 etc/\1\2@' \
         -e 's@install etc/\(.*\)\(daily\)@install -m744 etc/\1\2@' \
         -e 's@install etc/\(.*\)\(hourly\)@install -m744 etc/\1\2@' \
         -e 's@install etc/\(.*\)\(monthly\)@install -m744 etc/\1\2@' \
         -e 's@install etc/\(.*\)\(weekly\)@install -m744 etc/\1\2@' \
      Makefile

  # Some crontab implementations have different syntax
  case $( env pacman -Qs cron | grep -e '^local/' ) in
    local/dcron*)
      sed -i -e 's@PATH=@#PATH=@' \
             -e 's@root zfs-@zfs-@' \
             etc/zfs-auto-snapshot.cron.frequent
    ;;
  esac

  ### Uncommet the following if you use zfs-fuse. There seems to be a
  ### bug in zfs-fuse, which results in snapshots being created,  but
  ### not displayed  with the "zfs list -t snapshot" command.
  ### See http://groups.google.com/group/zfs-fuse/browse_thread/thread/eab2b704d4275b8e
  #sed -i 's@SNAPPROP=.*@SNAPPROP=\"\"@' src/zfs-auto-snapshot.sh

  ### Uncomment the following 4 lines to change the snapshot name to
  ### @PREFIX_DATE_LABEL instead of @PREFIX-LABEL_DATE
  ### (this makes the automounted snapshots nicely sorted by time)
  #sed -i \
  # -e 's@SNAPNAME=\"\$opt_prefix\${opt_label:+\$opt_sep\$opt_label-\$DATE}\"@SNAPNAME=\"\$opt_prefix\${opt_label:+_$DATE\$opt_sep\$opt_label}"@' \
  # -e 's@SNAPGLOB=\"\$opt_prefix\${opt_label:+?\$opt_label}????????????????\"@SNAPGLOB=\"\$opt_prefix\${opt_label:+?????????????????\$opt_label}\"@' \
  # src/zfs-auto-snapshot.sh

  ### Uncomment the following line to change the prefix to a shorter string
  #sed -i 's@ zfs-auto-snapshot @ zfs-auto-snapshot --prefix=auto @' etc/*.cron.*
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="" install
}

# vim:set ts=2 sw=2 et:
