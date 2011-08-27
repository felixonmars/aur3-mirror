# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname=gedit-source-code-browser-git
pkgver=20110704
pkgrel=1
pkgdesc="A source code class and function browser plugin for Gedit 3."
arch=('any')
url="https://github.com/Quixotix/gedit-source-code-browser"
license=('custom')
depends=('gedit>=3' 'ctags')
install=gedit-source-code-browser.install
makedepends=('git')


_gitroot="https://github.com/Quixotix/gedit-source-code-browser.git"
_gitname="gedit-source-code-browser"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"

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

  # Ugly hack to get the license out of the README file.
  grep -A 999999 License README.markdown > LICENSE

  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
