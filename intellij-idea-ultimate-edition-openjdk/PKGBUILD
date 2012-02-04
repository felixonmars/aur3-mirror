# Maintainer: lin56
pkgname=intellij-idea-ultimate-edition-openjdk
pkgver=10
_buildver=99.18
#options=('force')
pkgrel=1
pkgdesc="IntelliJ IDEA 10 wih openjdk (WARNING not recommended by JetBrains)"
arch=('any')
url="http://www.jetbrains.com/idea/"
backup=("usr/share/${pkgname}/bin/idea.vmoptions")
license=('Comercial')
conflicts=('intellij-idea-ultimate-edition')
depends=('openjdk6')
source=(http://download.jetbrains.com/idea/ideaIU-$pkgver.tar.gz \
        intellijidea.sh
        idea.sh)
md5sums=('b9c0bc797e98e19f1d172e1dff2a73e4'
         '5f5dca59359a5e7f61985f5fe96326e8'
         'ac89fa77fa0c95004153820343d5a31d')

build() {
  cd "$srcdir"

  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "idea-IU-$_buildver" "$pkgdir/usr/share/$pkgname"
  chown -R 0:0 $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 0755 {} ';'
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 0644 {} ';'

  cp -f $srcdir/idea.sh $pkgdir/usr/share/$pkgname/bin/idea.sh
  chmod +x $pkgdir/usr/share/$pkgname/bin/idea.sh
  
  install -D -m755 $srcdir/idea.sh $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m755 $srcdir/intellijidea.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/idea-IU-$_buildver/license/IDEA_license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
