# Contributor: Egor Vakhromtsev <e.vakhromtsev gmail.com>
# Maintainer: Andrea Fagiani <andfagiani_at_gmail_dot_com>

pkgname=gmate-git
_gitname=${pkgname//-git/}
pkgver=0.11_5_g8d53915
pkgrel=1
pkgdesc="Set of plugins for Gedit including improvements for gtksourceview3 language files."
arch=(any)
url="http://github.com/gmate/gmate"
license=('GPL3')
depends=('gedit' 'pywebkitgtk' 'python2-pyinotify' 'shared-mime-info' 'python2-gconf')
makedepends=('git')
install=$pkgname.install
source=("$_gitname::git+http://github.com/gmate/gmate"
         gmate-activate)
md5sums=('SKIP'
         '61144cb0a538b579d63fc8daf9955efd')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe | sed 's#-#_#g;s#v##')
}

build() {
  cd $srcdir/$_gitname

#INFO: this is python2 stuff!
  for file in $(find . -name '*.py' -print); do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
      sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
  done

}

package() {
  cd $srcdir/$_gitname

# Copy language definitions
  mkdir -p $pkgdir/usr/share/gtksourceview-3.0/language-specs/
  install -m644 lang-specs/*.lang -t $pkgdir/usr/share/gtksourceview-3.0/language-specs/

# Copy Styles
  mkdir -p $pkgdir/usr/share/gtksourceview-3.0/styles
  install -m644 styles/* -t $pkgdir/usr/share/gtksourceview-3.0/styles/

# Register mime types
  mkdir -p $pkgdir/usr/share/mime/packages/
  install -Dm644 mime/*.xml -t $pkgdir/usr/share/mime/packages/

# Copy Gmate executable
  install -Dm755 gmate.py $pkgdir/usr/share/gedit/gmate/gmate.py
#INFO: make symlink here instead of post_install!
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/gedit/gmate/gmate.py $pkgdir/usr/bin/gmate

# Copy Tags
  mkdir -p $pkgdir/usr/share/gedit/plugins/taglist/
  install -m644 tags/*.tags.gz -t $pkgdir/usr/share/gedit/plugins/taglist/

# Copy Snippets
  mkdir -p $pkgdir/usr/share/gedit/plugins/snippets/
  install -m644 snippets/* -t $pkgdir/usr/share/gedit/plugins/snippets/

# Copy Plugins
  mkdir -p $pkgdir/usr/lib/gedit/plugins/
  cp -R plugins/gedit3/* $pkgdir/usr/lib/gedit/plugins/

  install -Dm755 $srcdir/gmate-activate $pkgdir/usr/bin/gmate-activate
}
