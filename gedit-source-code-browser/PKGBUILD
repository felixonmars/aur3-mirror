# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname=gedit-source-code-browser
pkgver=3.0.2
pkgrel=2
pkgdesc="A source code class and function browser plugin for Gedit 3."
arch=('any')
url="https://github.com/Quixotix/gedit-source-code-browser"
license=('custom')
depends=('gedit>=3' 'ctags')
install=gedit-source-code-browser.install
source=('code-browser.tar.gz::https://github.com/Quixotix/$pkgname/tarball/v$pkgver')
md5sums=('79453b0acdf05abd5d31964bf71d664f')

build() {
  # Ugly hack to get the name of the directory inside the tarball in a
  # version-independent way.
  # Github puts the commit hash in the directory name, even when
  # we request a tag.
  tarball_dir=$(tar tf $srcdir/code-browser.tar.gz | head -n 1)

  cd "$srcdir/$tarball_dir"

  install -d $pkgdir/usr/lib/gedit/plugins
  install -m644 sourcecodebrowser.plugin $pkgdir/usr/lib/gedit/plugins

  # Is there a better way to do this?
  for dir in $(find sourcecodebrowser -type d)
  do
    install -d $pkgdir/usr/lib/gedit/plugins/$dir
  done

  for file in $(find sourcecodebrowser -type f)
  do
    install -m644 $file $pkgdir/usr/lib/gedit/plugins/$(dirname $file)
  done

  install -d $pkgdir/usr/share/glib-2.0/schemas/
  install -m644  sourcecodebrowser/data/org.gnome.gedit.plugins.sourcecodebrowser.gschema.xml $pkgdir/usr/share/glib-2.0/schemas/

  # Another ugly hack to get the license out of the README file.
  grep -A 999999 License README.markdown > LICENSE

  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
