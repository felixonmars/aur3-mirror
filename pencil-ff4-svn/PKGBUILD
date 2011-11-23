# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=pencil-ff4-svn
pkgver=27
pkgrel=1
pkgdesc="A temporary branch of Evolus Pencil that supports firefox 4"
arch=('any')
url="http://code.google.com/p/pencil-ff4/"
license=('GPL2')
depends=('xulrunner')
makedepends=('subversion')
provides=('evolus-pencil-svn')
conflicts=('evolus-pencil-svn')
source=(pencil_add_file.patch pencil.sh pencil.desktop)
md5sums=('a7403aa5161c0abd82e652a994e84b4e'
         '55eada6fe52a4e49e8464a73a40011a2'
         'e091965f231208f4fc6e265f808f821c')

_svntrunk="http://pencil-ff4.googlecode.com/svn/trunk/"
_svnmod="pencil-ff4"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_svnmod"
  patch -Np1 < "$srcdir/pencil_add_file.patch" || true
  cd "$srcdir/$_svnmod/Build"
  # ignore errors - they usually come from the RPM/windows installer creation
  ./build.sh || true
}

package() {
  install -d -m755 "$pkgdir/usr/share/$pkgname"
  cd "$pkgdir/usr/share/$pkgname"
  bsdtar xf $srcdir/$_svnmod/Build/Outputs/*gz
  sed -i 's|\(MaxVersion\)=.*|\1=10.0|' application.ini
  # this binary doesn't work
  rm pencil
  # fix the premissions
  chown -R root:root "$pkgdir/usr/share/$pkgname"

  install -D -m755 "$srcdir/pencil.sh" "$pkgdir/usr/bin/pencil"
  install -D -m644 "$srcdir/pencil.desktop" "$pkgdir/usr/share/applications/pencil.desktop"
}

# vim:set ts=2 sw=2 et:
