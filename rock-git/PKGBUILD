# Contributor: mickael9 <mickael9 at gmail dot com>
pkgname=rock-git
pkgver=e73e1d1
pkgrel=1
pkgdesc="An ooc compiler written in ooc (git version)"
arch=(i686 x86_64)
url="http://ooc-lang.org/"
license=(BSD)
depends=(gcc-libs)
makedepends=(git curl)
provides=(rock)
conflicts=(rock)
options=(force)
_bootstrap="http://commondatastorage.googleapis.com/rock-linux/rock-bootstrap.tar.bz2"

build() {

  cd "$srcdir"

  rm -rf rock

  msg "Downloading latest tarball..."
  curl -\# "$_bootstrap" | tar -xj || return 1

  msg2 "Done. Now building."

  mkdir rock/bin
  cd rock/build
  ROCK_DIST=.. make

  cd ..
  mv bin/{c_rock,rock}

  mkdir -p "$pkgdir"/{usr/{bin,share/man/man1},opt/rock}
  cp -rt "$pkgdir/opt/rock" sdk libs bin docs
  ln -s /opt/rock/docs/rock.1 "$pkgdir/usr/share/man/man1/"
  echo 'ROCK_DIST=/opt/rock /opt/rock/bin/rock "$@"' > "$pkgdir/usr/bin/rock"
  chmod +x "$pkgdir/usr/bin/rock"

  install -D LICENSE "$pkgdir/usr/share/licenses/rock/LICENSE"
} 

devel_check() {
    newpkgver=""

    # Do not update pkgver if --holdver is set, when building a source package, repackaging,
    # reading PKGBUILD from pipe (-f), or if we cannot write to the file (-w)
    if (( HOLDVER || SOURCEONLY || REPKG )) \
        || [[ ! -f $BUILDFILE || ! -w $BUILDFILE ]]; then
        return
    fi

    if [[ -z $FORCE_VER ]]; then
        newpkgver=$(
            curl -s http://ooc-lang.org/alpaca/index |
            grep -Eo 'Get <a href="[^"]+">([^<]+)</a>' |
            grep -Po '(?<=">)[a-f0-9]{7,}')

        if [[ -n $newpkgver ]]; then
            msg2 "$(gettext "Version found: %s")" "$newpkgver"
        fi
    else
        # Version number retrieved from fakeroot->makepkg argument
        newpkgver=$FORCE_VER
    fi
}
