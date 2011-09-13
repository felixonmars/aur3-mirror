# Contributor: Glorf <michal99999@gmail.com>
pkgname=supertux-editor
pkgver=6693
pkgrel=1
pkgdesc="SVN official SuperTux Level Editor"
arch=(any)
source="supertux-editor-datadir.patch"
url="http://supertux.lethargik.org/"
license=('GPL')
md5sums=('d804d01fa72c7bcd336420459da731da')
depends=('supertux>=0.3.3' 'mesa' 'mono>=1.1.13' 'gtk-sharp-2' 'subversion')

build() {
  cd $startdir/src
  svn checkout http://supertux.lethargik.org/svn/supertux/trunk/supertux-editor
  cd $srcdir/$pkgname
  #This patch is changing datadir to arch ones
  patch $srcdir/$pkgname/$pkgname/Settings.cs < $startdir/supertux-editor-datadir.patch
  make
}
package() {
  cd $startdir/src/$pkgname
  install -d $startdir/pkg/usr/share/$pkgname
  install -d $startdir/pkg/usr/share/$pkgname/data
  install -d $startdir/pkg/usr/share/applications
  install -d $startdir/pkg/usr/share/pixmaps
  install -d $startdir/pkg/usr/bin
    for _file in gtkgl-sharp libeditor Lisp LispReader Resources; do
    install -m 755 $_file.dll $startdir/pkg/usr/share/$pkgname
    if [ -e $_file.dll.config ]; then
        install -m 644 $_file.dll.config $startdir/pkg/usr/share/$pkgname
    fi
  done
  
  cp -R data/* $startdir/pkg/usr/share/$pkgname/data
  install supertux-editor.exe $startdir/pkg/usr/share/$pkgname
  
  install $startdir/src/$pkgname/supertux-editor.desktop $startdir/pkg/usr/share/applications
  install supertux-editor.png supertux-editor.xpm $startdir/pkg/usr/share/pixmaps

  msg "Creating launcher"
  touch $startdir/pkg/usr/bin/supertux-editor
  echo "#!/bin/sh" >> $startdir/pkg/usr/bin/supertux-editor
  echo "/usr/bin/mono /usr/share/$pkgname/supertux-editor.exe" >> $startdir/pkg/usr/bin/supertux-editor
  chmod 755 $startdir/pkg/usr/bin/supertux-editor
}
