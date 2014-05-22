# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=conmux-git
pkgver=20140521
pkgrel=1
pkgdesc="A console multiplexor"
arch=('any')
url="https://github.com/autotest/autotest"
license=('GPL')
depends=('perl-io-multiplex' 'perl-uri')
makedepends=('git')

_gitroot=https://github.com/autotest/autotest.git
_gitname=autotest

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Cloning for build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build/conmux"

  make PREFIX="/usr" BUILD="$pkgdir/" install

  # Remove unnecessary start script
  rm -f "${pkgdir}/usr/sbin/start"

  # Rename the very generically named console
  mv -v "${pkgdir}/usr/bin/console" "${pkgdir}/usr/bin/conmux-console"

  # Move scripts to /usr/bin
  mv -v "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin/"

  # Move Conmux module to an appropriate path
  install -dm755 "${pkgdir}/usr/share/perl5/vendor_perl/Conmux"
  mv -v "${pkgdir}/usr/lib/Conmux.pm" "${pkgdir}/usr/share/perl5/vendor_perl/"
  mv -v "${pkgdir}/usr/lib"/* "${pkgdir}/usr/share/perl5/vendor_perl/Conmux/"

  # Remove unnecessary directories
  rm -rf "${pkgdir}/usr/"{etc,lib,log,sbin}
}

# vim:set ts=2 sw=2 et:
