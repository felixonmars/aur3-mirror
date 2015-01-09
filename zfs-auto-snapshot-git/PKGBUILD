# Maintainer: Marcel Huber <`echo "moc tod liamg ta oofrebuhlecram" | rev`>
# Contributor: float <flo.at at gmx dot de>
# Contributor: Milan Knížek <knizek@volny.cz>

pkgname=zfs-auto-snapshot-git
pkgver=1.2.1.1.r0.g63e4438
pkgrel=4
pkgdesc="An alternative implementation of the zfs-auto-snapshot service for Linux that is compatible with zfs-linux and zfs-fuse using systemd instead of cron."
arch=(i686 x86_64)
makedepends=('git')
url="https://github.com/zfsonlinux/zfs-auto-snapshot"
license=('GPL')
source=("$pkgname"::'git+https://github.com/zfsonlinux/zfs-auto-snapshot#branch=debian')
install="$pkgname.install"
sha256sums=('SKIP')
depends=('systemd>=212')
replaces=(zfs-auto-snapshot-systemd-git)

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

_PREFIX="/usr"

build() {
  msg 'Starting make...'
  cd "$srcdir/$pkgname"
  sed -i -e 's@/sbin@/bin@' \
         -e '/.cron./d' \
      Makefile

  ### Uncommet the following if you use zfs-fuse. There seems to be a
  ### bug in zfs-fuse, which results in snapshots being created,  but
  ### not displayed  with the "zfs list -t snapshot" command.
  ### See http://groups.google.com/group/zfs-fuse/browse_thread/thread/eab2b704d4275b8e
  #sed -i 's@SNAPPROP=.*@SNAPPROP=\"\"@' src/zfs-auto-snapshot.sh

  ### COMMENT the following 4 lines to NOT change the snapshot name to
  ### @PREFIX_DATE_LABEL instead of @PREFIX-LABEL_DATE
  ### (the following makes the snapshots nicely sorted by time)
  sed -r -i \
   -e 's@^(SNAPNAME="\$)(opt_prefix)(.*)-\$DATE@\1{\2}_$DATE\3@' \
   -e 's@^(SNAPGLOB="\$)(opt_prefix)(.*})([?]+)@\1{\2}\4\3@' \
   src/zfs-auto-snapshot.sh

  mkdir -p systemdfiles
  ### "Label|NumberOfKeptSnapshots|systemd-timer-spec" of snapshots, eg. timer and service files, being created
  ### adjust/extend if required
  declare -a arr=(
    "frequent|4|*:0/15"
    "hourly|24|hourly"
    "daily|31|daily"
    "weekly|8|weekly"
    "monthly|12|monthly"
  )
  for i in "${arr[@]}"
  do
    _label="$(echo $i | cut -d'|' -f1)"
    _keep="$(echo $i | cut -d'|' -f2)"
    _OnCalendarSpec="$(echo $i | cut -d'|' -f3)"
	### REMOVE OR CHANGE --prefix to change snapshot prefix
	_prefix="--prefix=znap"
    # write service files
    cat > systemdfiles/zfs-auto-snapshot-${_label}.service <<EOF
[Unit]
Description=ZFS $_label snapshot service

[Service]
ExecStart=$_PREFIX/bin/zfs-auto-snapshot $_prefix --quiet --syslog --label=$_label --keep=$_keep //
EOF

    # write timer files
    cat > systemdfiles/zfs-auto-snapshot-${_label}.timer <<EOF
# See systemd.timers and systemd.time manpages for details
[Unit]
Description=ZFS $_label snapshot timer

[Timer]
OnCalendar=$_OnCalendarSpec
Persistent=true

[Install]
WantedBy=timers.target
EOF
  done
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="$_PREFIX" install
  mkdir -p $pkgdir"/usr/lib/systemd/system/"
  install -Dm644 systemdfiles/* $pkgdir"/usr/lib/systemd/system/"
}

# vim:set ts=2 sw=2 et:
