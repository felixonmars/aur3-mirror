# Maintainer: Denis Dzenskevich <denis.dzenskevich at gmail.com>
# Contributor: scheffold <fscheffold (at) gmail.com>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>
# Contributor: Alex Talker <alextalker at openmailbox dot org>

pkgname=intellij_idea_ce_13_eap
pkgver=135.760
pkgrel=1
install=intellijidea.install
pkgdesc="Early access version of the upcoming Intellij Idea 13 Java IDE (community version)"
arch=('i686' 'x86_64')
url="http://confluence.jetbrains.net/display/IDEADEV/IDEA+13+EAP"
backup=(
    "usr/share/${pkgname}/bin/idea.vmoptions" 
    "usr/share/${pkgname}/bin/idea64.vmoptions" 
    "usr/share/${pkgname}/bin/idea.properties")
license=('apache')
depends=('java-environment')
options=('!strip')

source=(\
    "idea.vmoptions" \
    "intellijidea.sh" \
    "intellijidea.desktop" \
    "intellijidea.install" \
    "http://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz")
    #"http://download.jetbrains.com/idea/ideaIC-13.0.2.tar.gz")

package() {
  cd "$srcdir"

  if [ "$CARCH" = "i686" ]; then
    _rmpostfix="64"
    _retainpostfix=""
  elif [ "$CARCH" = "x86_64" ]; then
    _rmpostfix=""
    _retainpostfix="64"
  fi

  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "idea-IC-$pkgver" "$pkgdir/usr/share/$pkgname"
  sed -i 's|\.IntelliJIdea\/|\.IntelliJIdea13\/|' "$pkgdir/usr/share/$pkgname/bin/idea.properties"

  cp "$srcdir"/idea.vmoptions "$pkgdir"/usr/share/$pkgname/bin

  chmod +x $pkgdir/usr/share/$pkgname/bin/idea.sh
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier$_retainpostfix

  rm $pkgdir/usr/share/intellij_idea_ce_13_eap/bin/fsnotifier$_rmpostfix
  rm $pkgdir/usr/share/intellij_idea_ce_13_eap/bin/libbreakgen$_rmpostfix.so
  #rm $pkgdir/usr/share/intellij_idea_ce_13_eap/bin/libyjpagent-linux$_rmpostfix.so

  install -D -m755 $srcdir/intellijidea.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/intellijidea.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/idea-IC-$pkgver/bin/idea.png $pkgdir/usr/share/pixmaps/$pkgname.png
  #install -D -m644 $srcdir/idea-IC-$pkgver/license/IDEA_license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
md5sums=('c51777b27eed5cca4d0406b3cf060406'
         '91fe7c0e87c482e5001f302c924c1098'
         'f7894a9b3298c4183f80852446ab1343'
         '48130e94e6b816978f90b6f05b788ffc'
         '99b5f724128d99b2764f34a0d4111d79')

