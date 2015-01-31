### MyEclipse 2015 Stable 1.0

**MyEclipse 2015 Stable 1.0** is the first production-grade release of MyEclipse 2015.
This release is very focused on web and mobile features, as well as important
productivity-enhancing improvements.

MyEclipse 2015 is a unified product. Users no longer need to download separate
installers for Blue/Bling/Spring versions.

===================================================================

### Notice

I've included the binary package in my own repository. Please visit http://git.io/-1
and add my repository, then execute the following command to install the package.

```sh
$ sudo pacman -Syu myeclipse-pro
```

For change of the `PKGBUILD` and other files, please see
https://github.com/Firef0x/AUR-Firef0x/tree/master/aur/myeclipse-pro

Making an issue or a pull request is also welcomed.

#### Please read the following before you build your own package with `PKGBUILD`:

1. Please make sure you have at lease **4.0GB** free space in the partition where
   the file `PKGBUILD` lies.(1.35GB for downloading files, 1.5GB for installing
   the software, 1.35GB for packaging the .pkg.tar.* file) So please **DON'T USE**
   `yaourt`/`packer` etc. which builds package in your `/tmp` directory when you
   don't have enough free space in your `/tmp` directory.
2. Please make sure you have your **swap** turned on, for unknown reason, MyEclipse
   would check the status of swap and return an "insufficient disk space" error
   when swap not found, even you **DO HAVE** enough free space in both disk and
   memory.
3. Please feel free to change `_rmbinary` and `_lndropins` in the file `PKGBUILD`
   to customize the packaging action.

   3.1 if `_rmbinary` equals **1**, it would remove the shipped-with Java
       development toolkit and depends on the package `java-environment`;
   3.2 if `_lndropins` equals **1**, it would links the directory `dropins` to
       the one in `/usr/share/eclipse`, so that it can use the Eclipse plugins
       which are managed by `pacman`.

4. Since building and packaging take a long time, please feel free to uncomment
   the field `PKGEXT` and change it to `.pkg.tar` or `.pkg.tar.gz`.
5. Please never run `makepkg` **AS ROOT**, as it may do harm to your system.
   Hence, I have to announce : "**USE IT AT YOUR OWN RISK. CAVEAT EMPTOR.**"
6. For any action for copyright infringement, please contact
   **#1 HM Fort Roughs, the Principality of Sealand**.

===================================================================

### What's new (01/15/2015)

1. Custom Integration of tern.java
2. Initial Support for AngularJS
3. New REST Explorer Provides More Flexibility
4. REST Web Services Project Explorer
5. Mobile Tooling - PhoneGap Support
6. New PhoneGap Configuration Editor
7. PhoneGap Project JQuery Mobile Templates
8. Server Connectors Updated to the WTP Framework
9. Deployment Mode Flexibility for Tomcat App Servers
10. Custom Deployment Server
11. Pivotal tc Server 3.0 Support
12. Updated TomEE Server Connector
13. Dashboard and Other Tools Make Tasks Easier
14. Coding Report
15. Improved Dark Theme
16. Built on Luna 4.4.1
17. Update to MyEclipse Reports
18. Intelligent Merged Deployment
19. New Maven Dependencies-Only Mode
20. JSP Editor Performance Improvements
21. Updated Spring Support
22. Try Upgraded Features with Integrated Upgrade Trials
23. Other Notable Additions
24. Fix Known Issues

===================================================================

### See also

* [MyEclipse Delivery Log: Stable Stream](https://www.genuitec.com/products/myeclipse/deliverylog/stable/)
* [MyEclipse 2015 Stable 1.0 - Standard / Pro / Blue / etc](https://www.myeclipseide.com/PNphpBB2-viewtopic-t-30711.html)
