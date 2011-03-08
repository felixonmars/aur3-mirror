# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gtkpyglot
pkgver=2.2
pkgrel=1
pkgdesc="A python desktop tool for software translators"
arch=(any)
url="https://bitbucket.org/vkolev/gtkpyglot"
license=('GPL')
depends=('pygtk' 'python-simplejson' 'python-configobj' 'python-pysqlite')
install="$pkgname.install"
source=("https://bitbucket.org/vkolev/gtkpyglot/get/${pkgname}_${pkgver}.tar.bz2"
        "$pkgname.desktop")
md5sums=('52db028c4df85d8f8b7275b2009e7cc7'
         '13ee4c6e36d012a5029f6f38f0dde31f')

build() {
  cd "$srcdir"/vkolev*

  # python2 fixes and path fixes
  sed -e "s|\(python2\).6|\1|;s|sys\.path\[0\]|\"/usr/share/$pkgname\"|;s|\./|/usr/share/|" \
      -e "s|data/\($pkgname.*\)cur_path|/\.\1os.path.expanduser(\"~\")|" \
      -i $pkgname.py
}

package() {
  cd "$srcdir"/vkolev*

  # bin
  install -Dm755 $pkgname.py "$pkgdir/usr/bin/$pkgname"

  # data
  install -d "$pkgdir/usr/share/$pkgname/data"
  install -Dm644 data/* "$pkgdir/usr/share/$pkgname/data"

  # locale
  cp -a locale "$pkgdir/usr/share"

  # desktop
  install -Dm644 ../$pkgname.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 data/pyglot_64.png \
          "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 data/pyglot_64.png \
          "$pkgdir/usr/share/$pkgname/data/$pkgname.png"

  # configuration file
  echo -e "deflang = 0\nmode = 1\ndatabase= \"\"" > "$pkgdir/usr/share/$pkgname/data/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
