#Contributor: Yahya Mohajer < yaya_2013 At yahoo Dot com >

pkgname=jenkins-lts
pkgver=1.409.3
pkgrel=beta1
_wrapver=3.4.1
pkgdesc="Extensible Continuous Integration Server. Hudson forks- LTS version"
url="http://jenkins-ci.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('java-environment')
optdepends=('apache: a full featured webserver'
            'maven: a java project management and project comprehension tool'
            'ttf-dejavu: Font family based on the Bitstream Vera Fonts with a wider range of characters'
            'libcups: The CUPS Printing System - client libraries and headers')

conflicts=('jenkins-lts')
provides=('jenkins-lts')
options=(!strip !docs )

install=jenkins-lts.install
backup=(opt/jenkins-lts/conf/wrapper.conf)
source=(http://mirrors.jenkins-ci.org/war-stable/${pkgver}/jenkins.war
        http://wrapper.tanukisoftware.org/download/$_wrapver/wrapper-delta-pack-$_wrapver.tar.gz
        'wrapper.conf'
        'jenkins-lts')	

noextract=(jenkins.war)

md5sums=('2783375695e85c50f92e07e5885aeac3'
         'a4eb5f779b09fdba71c8b94450169bcc'
         '4f5ba6f36114c82ed46b37e1502a8035'
         '7969490e36187fa5f199acb3ec3b31f5')

build() {
  cd ${srcdir}

  # Create directory
  install -dm755 $pkgdir/opt/jenkins-lts
  install -dm755 $pkgdir/opt/jenkins-lts/bin
  install -dm755 $pkgdir/opt/jenkins-lts/lib
  install -dm755 $pkgdir/opt/jenkins-lts/conf
  install -dm755 $pkgdir/opt/jenkins-lts/logs
  install -dm755 $pkgdir/opt/jenkins-lts/tmp

  # prepare wrapper
  if [ $CARCH = 'x86_64' ]; then
    install -Dm755  $srcdir/wrapper-delta-pack-$_wrapver/bin/wrapper-linux-x86-64    $pkgdir/opt/jenkins-lts/bin/wrapper
    install -Dm644 $srcdir/wrapper-delta-pack-$_wrapver/lib/libwrapper-linux-x86-64.so $pkgdir/opt/jenkins-lts/lib/
  elif [ $CARCH = 'i686' ]; then
    install -Dm755  $srcdir/wrapper-delta-pack-$_wrapver/bin/wrapper-linux-x86-32 $pkgdir/opt/jenkins-lts/bin/wrapper
    install -Dm644  $srcdir/wrapper-delta-pack-$_wrapver/lib/libwrapper-linux-x86-32.so $pkgdir/opt/jenkins-lts/lib/
  fi
   install -Dm644 $srcdir/wrapper-delta-pack-$_wrapver/lib/wrapper.jar $pkgdir/opt/jenkins-lts/lib/
   install -Dm644 $srcdir/wrapper-delta-pack-$_wrapver/logs/wrapper.log $pkgdir/opt/jenkins-lts/logs/

   install -Dm644 $srcdir/jenkins.war $pkgdir/opt/jenkins-lts/lib/

   install -Dm644 $srcdir/wrapper.conf $pkgdir/opt/jenkins-lts/conf/
   install -Dm755 $srcdir/jenkins-lts $pkgdir/opt/jenkins-lts/bin/

   mkdir -p $pkgdir/var/lib/jenkins-lts
   mkdir -p $pkgdir/var/run/jenkins-lts

}
