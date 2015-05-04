# $Id$
# Maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au> aka flaccid

pkgname=rightlink-bin
_pkgname=rightlink
pkgver='10.0.rc4'
pkgrel=2
pkgdesc="RightLink version 10 (RL10) is a new version of RightScale's server agent that connects servers managed through RightScale to the RightScale cloud management platform."
license=('RightScale')
arch=('x86_64')
depends=('cloud-init')
provides=('rightlink')
url='http://docs.rightscale.com/rl/about.html'
source=("https://rightlinklite.s3.amazonaws.com/rll/${pkgver}/rightlink.tgz")
md5sums=('9047ab25ac853d82bcd679e0383525c9')
install='rightlink.install'
options=(emptydirs strip !docs !libtool !staticlibs)

package() {
  install -d "$pkgdir/run/rightlink"
  install -d "$pkgdir/usr/bin"
  install -D -m744 "$srcdir/$_pkgname/rightlink" "$pkgdir/usr/bin/"
  install -D -m644 "$srcdir/$_pkgname/rightlink.service" "$pkgdir/usr/lib/systemd/system/rightlink.service"
  install -D -m440 "$startdir/90-rightscale" "$pkgdir/etc/sudoers.d/90-rightscale"

  # create legacy secret symlink
  cd "$pkgdir/run/rightlink"
  ln -sf secret ../rll-secret

  # add a symlink for the binary in /usr/local/bin to support
  # the systemd service included in the source
  install -d "$pkgdir/usr/local/bin"
  cd "$pkgdir/usr/local/bin"
  ln -sf /usr/bin/rightlink ./rightlink

  # ensure these folders match standard permissions on filesystem
  chmod 750 "$pkgdir/etc/sudoers.d"
}

# vim:set ts=2 sw=2 et:
