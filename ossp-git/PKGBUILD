# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=ossp-git
pkgver=20100621
pkgrel=1
pkgdesc="Emulate OSS device using CUSE (from git)"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/osspd"
license=(GPL2)
depends=('fuse>=2.8.0')
makedepends=(git pulseaudio alsa-lib)
optdepends=("pulseaudio: PulseAudio backend"
            "alsa-lib: ALSA backend")
backup=(etc/conf.d/osspd)
provides=(ossp)
conflicts=(ossp)
install=ossp.install
source=(osspd.rc.d osspd.conf.d)
md5sums=('69b745e0c499cd50019266a99082ce8b'
         '5a5a3db1bb3c98d48d4794613cf12ef0')

_gitroot="git://osspd.git.sourceforge.net/gitroot/osspd/osspd"
_gitname="osspd"

build() {
  msg2 "Connecting to SourceForge GIT server...."

  cd "$srcdir"
  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull ) 
  else
    git clone $_gitroot $_gitname
  fi

  msg2 "GIT checkout done or server timeout"

  rm -rf $_gitname-build
  git clone -s $_gitname $_gitname-build
  cd $_gitname-build

  msg2 "Starting make..."

  # Suppress warnings
  CFLAGS+=" -fno-strict-aliasing"

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" prefix=/usr UDEVDIR=/lib/udev/rules.d install || return 1

  install -D -m644 README "$pkgdir/usr/share/doc/$pkgname/README"

  install -D -m755 "$srcdir/osspd.rc.d" "$pkgdir/etc/rc.d/osspd"
  install -D -m644 "$srcdir/osspd.conf.d" "$pkgdir/etc/conf.d/osspd"
}
