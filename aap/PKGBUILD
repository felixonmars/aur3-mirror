# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=aap
pkgver=1.093
pkgrel=1
pkgdesc="A-A-P makes it easy to locate, download, build and install software."
url="http://www.a-a-p.org/"
license=('GPL')
arch=('any')
depends=('python2')
source=(http://heanet.dl.sourceforge.net/sourceforge/a-a-p/$pkgname-$pkgver.zip)
md5sums=('bf3867aff7730e82c671c4a141683c24')


prepare() {
  # Python2
  find $srcdir/ -name "*.py" -execdir sed -i '{}' -e "s|#! /usr/bin/env python|#! /usr/bin/env python2|g" \;
  sed -i $pkgname -e "s|#! /usr/bin/env python|#! /usr/bin/env python2|"
}

package() {
  cd $srcdir
  
  # Avoid the interactive question
  mkdir $pkgdir/usr
  ./aap install PREFIX=$pkgdir/usr

  # Move mandir (sed-ing installfiles didn't work)
  mkdir $pkgdir/usr/share
  cp -dpr --no-preserve=ownership $pkgdir/usr/man $pkgdir/usr/share/man
  rm -r $pkgdir/usr/man
  
  # Remove reference of $pkgdir
  rm $pkgdir/usr/bin/aap
  cd $pkgdir/usr/bin
  ln -s ../lib/aap/Exec-$pkgver/aap .
  find $pkgdir -name "*.pyc" -execdir rm '{}' \;
}

