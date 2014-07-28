# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=invoiceplane-translations
pkgver=1.0.0
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=(any)
url="https://invoiceplane.com/"
license=('MIT')
depends=('invoiceplane')
source=("https://crowdin.net/download/project/fusioninvoice.zip")
sha512sums=('ec4eabe74d7199db86dd2d2915556b3c823b70f12f02a4a8e8f744a146e2825420fdc97ae99f21bcfce85b9418bb7e75dc0e0644296787c3ecafbaf321fd9e3c')

package() {
  cd ${srcdir}
  install -vdm0755 $pkgdir/usr/share/webapps/invoiceplane/application/language
  for dir in `find . -mindepth 3 -maxdepth 3`;
    do cp -av $dir/* $pkgdir/usr/share/webapps/invoiceplane/application/language/;
  done;
}
