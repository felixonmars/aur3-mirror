# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>
pkgname=bcel-tools
pkgver=5.2
pkgrel=2
pkgdesc="Tools shipped with BCEL library - BCELifier and BCELVerifier (JustIce)"
url="http://jakarta.apache.org/bcel/"
license=('APACHE')
depends=('jre')
makedepends=()
arch=('i686' 'x86_64')

source=(\
  http://www.apache.org/dist/jakarta/bcel/binaries/bcel-5.2.zip \
  bcelifier \
  bcelverifier
)

build()
{
  # Install jar
  install -D -m644 $startdir/src/bcel-5.2/bcel-5.2.jar $startdir/pkg/usr/share/java/bcel.jar || return 1

  # Install documentation
  install -d $startdir/pkg/usr/share/bcel || return 1
  cp $startdir/src/bcel-5.2/docs $startdir/pkg/usr/share/bcel -R || return 1

  # Change permissions
  chmod u=rwX,g=rX,o=rX $startdir/pkg/usr/share/bcel -R || return 1

  # Install startup scripts
  install -D -m755 $startdir/src/bcelifier $startdir/pkg/usr/bin/bcelifier || return 1
  install -D -m755 $startdir/src/bcelverifier $startdir/pkg/usr/bin/bcelverifier || return 1
}

md5sums=('699b883d5d83f473d56bc5a66f7f9264'
         '63de819000b8d734e2abe6d05c85d9b3'
         'ddbc2816d5b4764dbd1a11cbd6664b35')
