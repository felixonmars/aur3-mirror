# Contributor: Lorenzo Tomei <tomeil@tiscali.it>
# Contributor: Brian Lewis <brian@lorf.org>

pkgname=j-language
pkgver=6.02a
pkgrel=9
pkgdesc="J is a modern, high-level, general-purpose, high-performance programming language"
arch=(i686 x86_64)
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('bash' 'ncurses' 'java-runtime=6')
if [ "${CARCH}" = i686 ]; then
  md5sums=(d017843157736176ad779fb813521bfc 8360f4f719fb1eb4fb5489eb8c271c8f c43b8ada4bb495cd65e9fd55e1f30545 e6f459451224293d30b4bbc6386c03ee 0b63874a557b7c0caf5d87fd924ec523 b916085de18cd1bb67f2b3b40834da34)
  _bits=32
else
  md5sums=(1c7d6d51684cfa8247e77eef76281199 8360f4f719fb1eb4fb5489eb8c271c8f c43b8ada4bb495cd65e9fd55e1f30545 e6f459451224293d30b4bbc6386c03ee 0b63874a557b7c0caf5d87fd924ec523 b916085de18cd1bb67f2b3b40834da34)
  _bits=64
fi
source=("http://www.jsoftware.com/download/j602a_linux${_bits}.sh" jc.svg jw.svg jc.desktop jw.desktop jfe)
build() {
  cd $startdir/src
  tail -n +49 j602a_linux${_bits}.sh >install.tar.gz
  tar -xzf install.tar.gz
  rm install.tar.gz
  mkdir -p $startdir/pkg/usr/lib/j
  if [ "${_bits}" = 32 ]
  then cp -a j602/*    $startdir/pkg/usr/lib/j/
  else cp -a j64-602/* $startdir/pkg/usr/lib/j/
  fi
  echo "$pkgname-$pkgver-$pkgrel-${CARCH}.pkg.tar.gz (Arch Linux package)" > $startdir/pkg/usr/lib/j/bin/installer.txt
  rm $startdir/pkg/usr/lib/j/help.htm
  mkdir -p $startdir/pkg/usr/man/man1
  mv $startdir/pkg/usr/lib/j/help/man/jconsole.1 $startdir/pkg/usr/man/man1/
  rm -r $startdir/pkg/usr/lib/j/help/man
  echo "config=.user,'/config'[temp=.user,'/temp'[user=.>(1<#2!:5'HOME'){'/srv/j';home,'/j'" > $startdir/pkg/usr/lib/j/bin/profilex.ijs
  mkdir -p $startdir/pkg/usr/share/pixmaps
  install -D -m644 *.svg $startdir/pkg/usr/share/pixmaps/
  mkdir -p $startdir/pkg/usr/share/applications
  install -D -m644 *.desktop $startdir/pkg/usr/share/applications/
  mkdir -p $startdir/pkg/usr/bin
  install -D -m755 jfe $startdir/pkg/usr/bin/
  chown -R root:root $startdir/pkg
  mkdir -p -m755 $startdir/pkg/srv/j/temp
  chown -R nobody:nobody $startdir/pkg/srv/j
}
