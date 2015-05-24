# Maintainer: wrst <wesleystout@gmail.com>
pkgname=openlp-dev
pkgver=2.1.4
pkgrel=2
pkgdesc="Church presentation software (development version)."
arch=('any')
url='http://openlp.org/'
provides=('openlp')
conflicts=('openlp' 'openlp-bzr')
license=('GPLv2')
makedepends=('qt5-tools')
depends=('qt4' 'python' 'python-pyqt4' 'python-pyenchant' 'phonon'
    'python-chardet' 'python-lxml' 'python-beautifulsoup4' 'python-pyicu'
    'python-sqlalchemy' 'python-nose'
    'python-mock' 'python-mako' 'python-alembic' 'python-pyodbc'
    'python-xdg' 'mupdf')
optdepends=('libreoffice-impress: display impress presentations'
            'vlc: play multimedia')
install=openlp.install
source=(http://downloads.sourceforge.net/project/openlp/openlp/$pkgver/OpenLP-$pkgver.tar.gz openlp.sh)
md5sums=('ee7be1bda3c08a810cbb7377147cdd16'
         '56908c5e7807fe2a384aa55de3735f32')
sha1sums=('5b31e015826421c1194d1b8d5928cd6aec2fa323'
          'd40794631c19688eb1971eadeb108c5a2cc69506')

package() {
  cd "$srcdir/OpenLP-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/openlp"{.py,}

  echo "$pkgver" > "$pkgdir/usr/lib/python3.4/site-packages/openlp/.version"

  install -Dm0755 "$srcdir/openlp.sh" "$pkgdir/etc/profile.d/openlp.sh"
  install -Dm0644 "resources/openlp.desktop" "$pkgdir/usr/share/applications/openlp.desktop"
  install -Dm0644 "resources/images/openlp-logo.svg" "$pkgdir/usr/share/pixmaps/openlp.svg"
  install -Dm0644 "resources/images/openlp-logo-48x48.png" "$pkgdir/usr/share/pixmaps/openlp.png"

  #translations
  tsrcdir="$srcdir/OpenLP-$pkgver/resources/i18n"
  tdestdir="$pkgdir/usr/share/$pkgname/i18n"
  mkdir -p "$tdestdir"
  cd "$tsrcdir"
  
  for file in *.ts; do
    lconvert -i "$file" -o "$tdestdir/${file%%ts}qm"
  done
}

md5sums=('5ba4b7d42f8a7742c8bfba6860bcb0a3'
         '56908c5e7807fe2a384aa55de3735f32')
sha1sums=('34fde8cc6a2527dd974a1e0405510bb17b6afed6'
          'd40794631c19688eb1971eadeb108c5a2cc69506')
md5sums=('c9a8eef76fb1938631991f89c1fe1eeb'
         '56908c5e7807fe2a384aa55de3735f32')
sha1sums=('61b4fe56007d33e169234aec5fd4d96c5c142251'
          'd40794631c19688eb1971eadeb108c5a2cc69506')
md5sums=('ee7be1bda3c08a810cbb7377147cdd16'
         '56908c5e7807fe2a384aa55de3735f32')
sha1sums=('5b31e015826421c1194d1b8d5928cd6aec2fa323'
          'd40794631c19688eb1971eadeb108c5a2cc69506')
md5sums=('ee7be1bda3c08a810cbb7377147cdd16'
         '56908c5e7807fe2a384aa55de3735f32')
sha1sums=('5b31e015826421c1194d1b8d5928cd6aec2fa323'
          'd40794631c19688eb1971eadeb108c5a2cc69506')
