# Maintainer: wrst <wesleystout@gmail.com>
pkgname=openlp-bzr
pkgver=2286
pkgrel=2
pkgdesc="Church presentation software (development version)."
arch=('any')
url='http://openlp.org/'
provides=('openlp')
conflicts=('openlp')
license=('GPLv2')
makedepends=('bzr' 'qt5-tools')
depends=('qt4' 'python' 'python-pyqt4' 'python-pyenchant' 'phonon'
    'python-chardet' 'python-lxml' 'python-beautifulsoup4' 'python-pyicu'
    'python-sqlalchemy' 'python-nose'
    'python-mock' 'python-mako' 'python-alembic' 'python-pyodbc'
    'python-xdg')
optdepends=('libreoffice-impress: display impress presentations'
            'vlc: play multimedia')
install=openlp.install
source=(openlp.sh)
md5sums=('56908c5e7807fe2a384aa55de3735f32')
sha1sums=('d40794631c19688eb1971eadeb108c5a2cc69506')
 
_bzrtrunk=http://bazaar.launchpad.net/~openlp-core/openlp/trunk
_bzrmod=trunk
 
package() {
  cd "$srcdir"
 
  if [ ! -d "./$_bzrmod" ]; then
    bzr co --lightweight "$_bzrtrunk"
  else
    cd trunk
    bzr up
    cd ..
  fi
 
  [ -d "./$_bzrmod-build" ] && rm -rf "./$_bzrmod-build"
  cp -r "./$_bzrmod" "./$_bzrmod-build"
 
  cd "$srcdir/$_bzrmod-build"
  #python setup.py build
  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/openlp"{.py,}
 
  echo "$pkgver" > "$pkgdir/usr/lib/python3.4/site-packages/openlp/.version"
 
  install -Dm0755 "$srcdir/openlp.sh" "$pkgdir/etc/profile.d/openlp.sh"
  install -Dm0644 "resources/openlp.desktop" "$pkgdir/usr/share/applications/openlp.desktop"
  install -Dm0644 "resources/images/openlp-logo.svg" "$pkgdir/usr/share/pixmaps/openlp.svg"
  install -Dm0644 "resources/images/openlp-logo-48x48.png" "$pkgdir/usr/share/pixmaps/openlp.png"
 
  #translations
  tsrcdir="resources/i18n"
  tdestdir="$pkgdir/usr/share/openlp/i18n"
  mkdir -p "$tdestdir"
  cd "$tsrcdir"
 
  for file in *.ts; do
    lconvert -i "$file" -o "$tdestdir/${file%%ts}qm"
  done
}
